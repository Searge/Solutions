import hype.*;
import hype.extended.behavior.HOrbiter3D;

int           myStageW         = 700;
int           myStageH         = 700;

color         clrBG            = #111111;

String        pathDATA         = "../../data/";

// *************************************************************************************************************

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim         minim;
AudioPlayer   myAudio;
FFT           myAudioFFT;

boolean       showVisualizer   = false;

int           myAudioRange     = 11;
int           myAudioMax       = 100;

float         myAudioAmp       = 40.0;
float         myAudioIndex     = 0.2;
float         myAudioIndexAmp  = myAudioIndex;
float         myAudioIndexStep = 0.35;

float[]       myAudioData      = new float[myAudioRange];

// *************************************************************************************************************

HDrawablePool pool;
int           poolMax          = 6;
//                                 red      green    blue     cyan     yellow   magenta
color[]       palette          = {#FF0000, #00FF00, #0000FF, #00FFFF, #FFFF00, #FF00FF};

int           oRadiusMin       = 125;
int           oRadiusMax       = 300;

float         oSpeedZmin       = 0.05;
float         oSpeedZmax       = 5.0;

float         oSpeedYmin       = -0.05;
float         oSpeedYmax       = -5.0;

int           rotateNumX       = 0;
int           rotateNumY       = 0;
int           rotateNumZ       = 0;

// *************************************************************************************************************

PImage        planetTexture;

int           planetW, planetH;

int           numPointsW;
int           numPointsH_2pi; 
int           numPointsH;
float[]       coorX;
float[]       coorY;
float[]       coorZ;
float[]       multXZ;

// *************************************************************************************************************

void settings() {
	size(myStageW, myStageH, P3D);
}

void setup() {
	H.init(this).background(clrBG).use3D(true).autoClear(true);

	planetTexture = loadImage(pathDATA + "texture.png");
	planetW = planetH = 50;
	initializeSphere(planetW, planetH);

	minim   = new Minim(this);
	myAudio = minim.loadFile(pathDATA + "HECQ_With_Angels_Trifonic_Remix.wav");
	myAudio.loop();

	myAudioFFT = new FFT(myAudio.bufferSize(), myAudio.sampleRate());
	myAudioFFT.linAverages(myAudioRange);
	// myAudioFFT.window(FFT.GAUSS);

	pool = new HDrawablePool(poolMax);
	pool.autoAddToStage()
		.add ( new HSphere() )
		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();

					HDrawable d = (HDrawable) obj;
					d
						.size(10)
						.strokeWeight(0)
						.noStroke()
						.fill(palette[i])
						.anchorAt(H.CENTER)
					;

					HOrbiter3D orb = new HOrbiter3D(0, 0, 0)
						.target(d)
						.zSpeed(oSpeedZmin)
						.ySpeed(oSpeedYmin)
						.radius(oRadiusMax)
						.zAngle( (int)random(360) )
						.yAngle( (int)random(360) )
					;

					d.extras( new HBundle().num("i", i).obj("o", orb) );
				}
			}
		)
		.requestAll()
	;
}

void draw() {
	myAudioFFT.forward(myAudio.mix);
	myAudioDataUpdate();

	noLights();

	pushMatrix();
		translate(width/2, height/2, 0);

		rotateX( map(rotateNumX, 0, myAudioMax, -(TWO_PI / 20), TWO_PI / 20) );
		rotateY( map(rotateNumY, 0, myAudioMax, -(TWO_PI / 20), TWO_PI / 20) );
		rotateZ( map(rotateNumZ, 0, myAudioMax, -(TWO_PI / 20), TWO_PI / 20) );

		int fftRotateX = (int)map(myAudioData[0], 0, myAudioMax, -1,  20); // controlled by [0] base
		int fftRotateY = (int)map(myAudioData[3], 0, myAudioMax, -1,  20); // controlled by [3] snare
		int fftRotateZ = (int)map(myAudioData[5], 0, myAudioMax,  1, -20); // controlled by [5] just arbitrary

		rotateNumX += fftRotateX;
		rotateNumY += fftRotateY;
		rotateNumZ += fftRotateZ;

		lights();
		sphereDetail(10);
		H.drawStage();
		noLights();

		for (HDrawable d : pool) {
			HBundle tempExtra = d.extras();
			int i = (int)tempExtra.num("i");
			HOrbiter3D o = (HOrbiter3D) tempExtra.obj("o");

			// change speed of orbits based on audio reaction

			int   fftRadius;
			float fftZspeed, fftYspeed;

			switch (i) {
				case 0 :
					pointLight(255, 0, 0,   o.x(), o.y(), o.z()); // RED
					fftRadius = (int)map(myAudioData[i], 0, myAudioMax, oRadiusMin, oRadiusMax);
					fftZspeed =      map(myAudioData[i], 0, myAudioMax, oSpeedZmin, oSpeedZmax);
					fftYspeed =      map(myAudioData[i], 0, myAudioMax, oSpeedYmin, oSpeedYmax);
					o.zSpeed(fftZspeed).ySpeed(fftYspeed).radius(fftRadius);
				break;

				case 1 :
					pointLight(0, 255, 0,   o.x(), o.y(), o.z()); // GREEN
					fftRadius = (int)map(myAudioData[i], 0, myAudioMax, oRadiusMin, oRadiusMax);
					fftZspeed =      map(myAudioData[i], 0, myAudioMax, oSpeedZmin, oSpeedZmax);
					fftYspeed =      map(myAudioData[i], 0, myAudioMax, oSpeedYmin, oSpeedYmax);
					o.zSpeed(fftZspeed).ySpeed(fftYspeed).radius(fftRadius);
				break;

				case 2 :
					pointLight(0, 0, 255,   o.x(), o.y(), o.z()); // BLUE
					fftRadius = (int)map(myAudioData[i], 0, myAudioMax, oRadiusMin, oRadiusMax);
					fftZspeed =      map(myAudioData[i], 0, myAudioMax, oSpeedZmin, oSpeedZmax);
					fftYspeed =      map(myAudioData[i], 0, myAudioMax, oSpeedYmin, oSpeedYmax);
					o.zSpeed(fftZspeed).ySpeed(fftYspeed).radius(fftRadius);
				break;

				case 3 :
					pointLight(0, 255, 255, o.x(), o.y(), o.z()); // CYAN
					fftRadius = (int)map(myAudioData[i], 0, myAudioMax, oRadiusMin, oRadiusMax);
					fftZspeed =      map(myAudioData[i], 0, myAudioMax, oSpeedZmin, oSpeedZmax);
					fftYspeed =      map(myAudioData[i], 0, myAudioMax, oSpeedYmin, oSpeedYmax);
					o.zSpeed(fftZspeed).ySpeed(fftYspeed).radius(fftRadius);
				break;

				case 4 :
					pointLight(255, 255, 0, o.x(), o.y(), o.z()); // YELLOW
					fftRadius = (int)map(myAudioData[i], 0, myAudioMax, oRadiusMin, oRadiusMax);
					fftZspeed =      map(myAudioData[i], 0, myAudioMax, oSpeedZmin, oSpeedZmax);
					fftYspeed =      map(myAudioData[i], 0, myAudioMax, oSpeedYmin, oSpeedYmax);
					o.zSpeed(fftZspeed).ySpeed(fftYspeed).radius(fftRadius);
				break;

				case 5 :
					pointLight(255, 0, 255, o.x(), o.y(), o.z()); // MAGENTA
					fftRadius = (int)map(myAudioData[i], 0, myAudioMax, oRadiusMin, oRadiusMax);
					fftZspeed =      map(myAudioData[i], 0, myAudioMax, oSpeedZmin, oSpeedZmax);
					fftYspeed =      map(myAudioData[i], 0, myAudioMax, oSpeedYmin, oSpeedYmax);
					o.zSpeed(fftZspeed).ySpeed(fftYspeed).radius(fftRadius);
				break;
			}
		}
	popMatrix();

	pointLight(100, 100, 100, width/2, -500, 500); // soft gray top light

	pushMatrix();
		translate(width/2, height/2, 0);
		rotateX( map(rotateNumX, 0, myAudioMax, -(TWO_PI / 20), TWO_PI / 20) );
		rotateY( map(rotateNumY, 0, myAudioMax, -(TWO_PI / 20), TWO_PI / 20) );
		rotateZ( map(rotateNumZ, 0, myAudioMax, -(TWO_PI / 20), TWO_PI / 20) );

		// draw a textured sphere in the center

		textureSphere(125, 125, 125, planetTexture);
	popMatrix();

	if (showVisualizer) myAudioDataWidget();
}

// based on / https://processing.org/examples/texturesphere.html Texture Sphere by Gillian Ramsay

void initializeSphere(int numPtsW, int numPtsH_2pi) {
	numPointsW=numPtsW+1;
	numPointsH_2pi=numPtsH_2pi;
	numPointsH=ceil((float)numPointsH_2pi/2)+1;

	coorX  = new float[numPointsW];
	coorY  = new float[numPointsH];
	coorZ  = new float[numPointsW];
	multXZ = new float[numPointsH];

	for (int i=0; i<numPointsW ;i++) {
		float thetaW=i*2*PI/(numPointsW-1);
		coorX[i]=sin(thetaW);
		coorZ[i]=cos(thetaW);
	}
	
	for (int i=0; i<numPointsH; i++) {
		if (int(numPointsH_2pi/2) != (float)numPointsH_2pi/2 && i==numPointsH-1) {
			float thetaH=(i-1)*2*PI/(numPointsH_2pi);
			coorY[i]=cos(PI+thetaH); 
			multXZ[i]=0;
		} else {
			float thetaH=i*2*PI/(numPointsH_2pi);
			coorY[i]=cos(PI+thetaH); 
			multXZ[i]=sin(thetaH);
		}
	}
}

void textureSphere(float rx, float ry, float rz, PImage t) { 
	float changeU=t.width/(float)(numPointsW-1); 
	float changeV=t.height/(float)(numPointsH-1); 
	float u=0;
	float v=0;

	beginShape(TRIANGLE_STRIP);
		strokeWeight(0);
		noStroke();
		texture(t);
		for (int i=0; i<(numPointsH-1); i++) {
			float coory=coorY[i];
			float cooryPlus=coorY[i+1];

			float multxz=multXZ[i];
			float multxzPlus=multXZ[i+1];

			for (int j=0; j<numPointsW; j++) {
				normal(-coorX[j]*multxz, -coory, -coorZ[j]*multxz); // inverted all components
				vertex(coorX[j]*multxz*rx, coory*ry, coorZ[j]*multxz*rz, u, v);
				normal(-coorX[j]*multxzPlus, -cooryPlus, -coorZ[j]*multxzPlus); // inverted all components
				vertex(coorX[j]*multxzPlus*rx, cooryPlus*ry, coorZ[j]*multxzPlus*rz, u, v+changeV);
				u+=changeU;
			}
			v+=changeV;
			u=0;
		}
	endShape();
}

void myAudioDataUpdate() {
	for (int i = 0; i < myAudioRange; ++i) {
		float tempIndexAvg = (myAudioFFT.getAvg(i) * myAudioAmp) * myAudioIndexAmp;
		float tempIndexCon = constrain(tempIndexAvg, 0, myAudioMax);
		myAudioData[i]     = tempIndexCon;
		myAudioIndexAmp+=myAudioIndexStep;
	}
	myAudioIndexAmp = myAudioIndex;
}

void myAudioDataWidget() {
	noLights();
	hint(DISABLE_DEPTH_TEST);
	noStroke(); fill(0,200); rect(0, height-112, width, 102);
	for (int i = 0; i < myAudioRange; ++i) {
		fill(#CCCCCC); rect(10 + (i*5), (height-myAudioData[i])-11, 4, myAudioData[i]);
	}
	hint(ENABLE_DEPTH_TEST);
}

void stop() {
	myAudio.close();
	minim.stop();  
	super.stop();
}



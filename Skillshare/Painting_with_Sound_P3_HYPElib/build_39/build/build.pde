import hype.*;
import hype.extended.behavior.HOrbiter3D;

int           myStageW         = 700;
int           myStageH         = 700;

color         clrBG            = #202020;

String        pathDATA         = "../../data/";

// *************************************************************************************************************

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim         minim;
AudioPlayer   myAudio;
FFT           myAudioFFT;

boolean       showVisualizer   = true;

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

// *************************************************************************************************************

void settings() {
	size(myStageW, myStageH, P3D);
}

void setup() {
	H.init(this).background(clrBG).use3D(true).autoClear(true);

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
						.noStroke()
						.fill(palette[i])
						.anchorAt(H.CENTER)
					;

					HOrbiter3D orb = new HOrbiter3D(width/2, height/2, 0)
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

	// draw sphere in the center

	pushMatrix();
		translate(width/2, height/2, 0);
		sphereDetail(75);
		noStroke(); fill(255); sphere(125); noStroke(); noFill();
	popMatrix();

	if (showVisualizer) myAudioDataWidget();
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
		fill(#CCCCCC); // set base color
		switch (i) {
			case 0 :
				fill(#FF0000); // RED
			break;

			case 1 :
				fill(#00FF00); // GREEN
			break;

			case 2 :
				fill(#0000FF); // BLUE
			break;

			case 3 :
				fill(#00FFFF); // CYAN
			break;

			case 4 :
				fill(#FFFF00); // YELLOW
			break;

			case 5 :
				fill(#FF00FF); // MAGENTA
			break;
		}
		rect(10 + (i*5), (height-myAudioData[i])-11, 4, myAudioData[i]);
	}
	hint(ENABLE_DEPTH_TEST);
}

void stop() {
	myAudio.close();
	minim.stop();  
	super.stop();
}



import hype.*;
import hype.extended.behavior.HOrbiter3D;

int           myStageW         = 700;
int           myStageH         = 700;

color         clrBG            = #202020;

String        pathDATA         = "../../data/";

// ****************************************************************************************

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

// ****************************************************************************************

HDrawablePool pool;
int           poolMax          = 6;
//                                 red      green    blue     cyan     yellow   magenta
color[]       palette          = {#FF0000, #00FF00, #0000FF, #00FFFF, #FFFF00, #FF00FF};

int           oRadiusMin       = 125; // CONTROL ORBITS POSSITION
int           oRadiusMax       = 250; // CONTROL ORBITS POSSITION

// ****************************************************************************************

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
		.add ( new HSphere() ) // <- .add ( new HEllipse(10) )
		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();

					HDrawable d = (HDrawable) obj;
					d
						.size(10) // ADDED
						.noStroke()
						.fill(palette[i])
						.anchorAt(H.CENTER)
					;

					HOrbiter3D orb = new HOrbiter3D(width/2, height/2, 0)
						.target(d)
						.zSpeed( random(-2, 2)+0.1 )
						.ySpeed( random(-1, 1)+0.1 )
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
	lights(); // White Ambient light turn on for little orbits
	sphereDetail(10);
	H.drawStage();
	noLights(); // & then turn off

	for (HDrawable d : pool) {
		HBundle tempExtra = d.extras();
		int i = (int)tempExtra.num("i");
		HOrbiter3D o = (HOrbiter3D) tempExtra.obj("o");

		// create lights MAPPED to 3D orbits for sphere in the center
		// change radius of orbit based on audio reaction

		int fftRadius;

		switch (i) {
			case 0 :
				pointLight(255, 0, 0,   o.x(), o.y(), o.z()); // RED
				fftRadius = (int)map(myAudioData[i], 0, myAudioMax, oRadiusMin, oRadiusMax);
				o.radius(fftRadius);
			break;

			case 1 :
				pointLight(0, 255, 0,   o.x(), o.y(), o.z()); // GREEN
				fftRadius = (int)map(myAudioData[i], 0, myAudioMax, oRadiusMin, oRadiusMax);
				o.radius(fftRadius);
			break;

			case 2 :
				pointLight(0, 0, 255,   o.x(), o.y(), o.z()); // BLUE
				fftRadius = (int)map(myAudioData[i], 0, myAudioMax, oRadiusMin, oRadiusMax);
				o.radius(fftRadius);
			break;

			case 3 :
				pointLight(0, 255, 255, o.x(), o.y(), o.z()); // CYAN
				fftRadius = (int)map(myAudioData[i], 0, myAudioMax, oRadiusMin, oRadiusMax);
				o.radius(fftRadius);
			break;

			case 4 :
				pointLight(255, 255, 0, o.x(), o.y(), o.z()); // YELLOW
				fftRadius = (int)map(myAudioData[i], 0, myAudioMax, oRadiusMin, oRadiusMax);
				o.radius(fftRadius);
			break;

			case 5 :
				pointLight(255, 0, 255, o.x(), o.y(), o.z()); // MAGENTA
				fftRadius = (int)map(myAudioData[i], 0, myAudioMax, oRadiusMin, oRadiusMax);
				o.radius(fftRadius);
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



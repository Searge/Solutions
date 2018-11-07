import hype.*;

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
int           poolMax          = 100;

// ****************************************************************************************

void settings() {
	size(myStageW, myStageH);
}

void setup() {
	H.init(this).background(clrBG).autoClear(false); // Leave traces on screen

	minim   = new Minim(this);
	myAudio = minim.loadFile(pathDATA + "HECQ_With_Angels_Trifonic_Remix.wav");
	myAudio.loop();

	myAudioFFT = new FFT(myAudio.bufferSize(), myAudio.sampleRate());
	myAudioFFT.linAverages(myAudioRange);
	myAudioFFT.window(FFT.GAUSS);

	pool = new HDrawablePool(poolMax);
	pool.autoAddToStage()
		.add ( new HRect(100).rounding(10) )
		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int ranIndex = (int)random(myAudioRange);

					HDrawable d = (HDrawable) obj;
					d
						.stroke(0)
						.fill(255, 225)
						.anchorAt(H.CENTER)
						.rotation(45)
						.loc( (int)random(width), (int)random(height) )
						.extras( new HBundle().num("i", ranIndex) )
					;
				}
			}
		)
		.requestAll()
	;
}

void draw() {
	myAudioFFT.forward(myAudio.mix);
	myAudioDataUpdate();

	H.drawStage();

	for (HDrawable d : pool) {
		HBundle tempExtra = d.extras();
		int i = (int)tempExtra.num("i");

		// Scale Color
		int fftFillColor = (int)map(myAudioData[i], 0, myAudioMax, 0, 255);
		// Scale Size
		int fftSize      = (int)map(myAudioData[i], 0, myAudioMax, 0, 300);

		d.fill(fftFillColor, 225).size(fftSize);
	}

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
	// noLights();
	// hint(DISABLE_DEPTH_TEST);
	noStroke(); fill(0,200); rect(0, height-112, width, 102);
	for (int i = 0; i < myAudioRange; ++i) {
		fill(#CCCCCC); rect(10 + (i*5), (height-myAudioData[i])-11, 4, myAudioData[i]);
	}
	// hint(ENABLE_DEPTH_TEST);
}

void stop() {
	myAudio.close();
	minim.stop();  
	super.stop();
}



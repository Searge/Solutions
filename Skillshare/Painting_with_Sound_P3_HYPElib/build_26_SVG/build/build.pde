import hype.*;

int           myStageW         = 700;
int           myStageH         = 700;

color         clrBG            = #000000;

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

//                                v BASE = orange            v SNARE = blue
color[]       palette          = {#FF3300,#FF620C,#FF9519,   #0095A8,   #FFC725,#F8EF33,#FFFF33,#CCEA4A,#9AD561,#64BE7A,#2EA893};

// ****************************************************************************************

void settings() {
	size(myStageW, myStageH);
}

void setup() {
	H.init(this).background(clrBG).autoClear(false);

	minim   = new Minim(this);
	myAudio = minim.loadFile(pathDATA + "HECQ_With_Angels_Trifonic_Remix.wav");
	myAudio.loop();

	myAudioFFT = new FFT(myAudio.bufferSize(), myAudio.sampleRate());
	myAudioFFT.linAverages(myAudioRange);
	myAudioFFT.window(FFT.GAUSS);

	pool = new HDrawablePool(poolMax);
	pool.autoAddToStage()						// our own style
		.add ( new HShape(pathDATA + "hex_1.svg").enableStyle(false).strokeJoin(CENTER).strokeCap(CENTER) )
		.add ( new HShape(pathDATA + "hex_2.svg").enableStyle(false).strokeJoin(CENTER).strokeCap(CENTER) )
		.add ( new HShape(pathDATA + "hex_3.svg").enableStyle(false).strokeJoin(CENTER).strokeCap(CENTER) )
		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int ranIndex = (int)random(myAudioRange);

					HDrawable d = (HDrawable) obj;
					d
						.stroke(0)
						.fill(palette[ranIndex], 200)
						.anchorAt(H.CENTER)
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

		int fftSize = (int)map(myAudioData[i], 0, myAudioMax, 0, 300);
		d.size(fftSize);
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



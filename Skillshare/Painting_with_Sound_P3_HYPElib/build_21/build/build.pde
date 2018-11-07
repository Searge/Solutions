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

boolean       showVisualizer   = false; // FALSE -> Turn off Widget

int           myAudioRange     = 11;
int           myAudioMax       = 100;

float         myAudioAmp       = 40.0;
float         myAudioIndex     = 0.2;
float         myAudioIndexAmp  = myAudioIndex;
float         myAudioIndexStep = 0.35;

float[]       myAudioData      = new float[myAudioRange];

// ****************************************************************************************

HDrawablePool pool;
int           poolMax          = 100; // <- 25;

// ****************************************************************************************

void settings() {
	size(myStageW, myStageH);
}

void setup() {
	H.init(this).background(clrBG);

	minim   = new Minim(this);
	myAudio = minim.loadFile(pathDATA + "HECQ_With_Angels_Trifonic_Remix.wav");
	myAudio.loop();

	myAudioFFT = new FFT(myAudio.bufferSize(), myAudio.sampleRate());
	myAudioFFT.linAverages(myAudioRange);
	myAudioFFT.window(FFT.GAUSS);

	pool = new HDrawablePool(poolMax);
	pool.autoAddToStage()
		.add ( new HRect(100).rounding(10) )
		// .layout (new HGridLayout().. <- 𝙍𝙚𝙢𝙤𝙫𝙚𝙙
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
						.loc( (int)random(width), (int)random(height) ) // locαтιoɴ
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

		int fftFillColor = (int)map(myAudioData[i], 0, myAudioMax, 0, 255);
		d.fill(fftFillColor, 225);

		// visualize which random numbers got picked

		if (i==0)      fill(#237D26); // base  / subitem 0
		else if (i==3) fill(#80C41C); // snare / subitem 3
		else           fill(#FF3300); // all others

		textSize(12); textAlign(CENTER); text(i, d.x(), d.y());
		// textSize(12); textAlign(CENTER); text(i, d.x(), height/2 + 100);
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



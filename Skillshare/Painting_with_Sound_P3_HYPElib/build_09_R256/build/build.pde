
String      pathDATA         = "../../data/";

// ****************************************************************************************

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim       minim;
AudioPlayer myAudio;
FFT         myAudioFFT;

int         myAudioRange     = 256;
int         myAudioMax       = 100;

float       myAudioAmp       = 20.0;
float       myAudioIndex     = 0.05;
float       myAudioIndexAmp  = myAudioIndex;
float       myAudioIndexStep = 0.025;

// ****************************************************************************************

int         rectSize         = 2;

int         stageMargin      = 100;
int         myStageW         = (myAudioRange * rectSize) + (stageMargin * 2);
int         myStageH         = 300;
color       clrBG            = #333333;

float       xStart           = stageMargin;
float       yStart           = stageMargin;
int         xSpacing         = rectSize;

// ****************************************************************************************

void settings() {
	size(myStageW, myStageH);
}

void setup() {
	background(clrBG);

	minim   = new Minim(this);
	myAudio = minim.loadFile(pathDATA + "HECQ_With_Angels_Trifonic_Remix.wav");
	myAudio.play();

	myAudioFFT = new FFT(myAudio.bufferSize(), myAudio.sampleRate());
	myAudioFFT.linAverages(myAudioRange);
	myAudioFFT.window(FFT.NONE);
}

void draw() {
	background(clrBG);

	myAudioFFT.forward(myAudio.mix);

	for (int i = 0; i < myAudioRange; ++i) {
		stroke(0); fill(255);
		float tempIndexAvg = (myAudioFFT.getAvg(i) * myAudioAmp) * myAudioIndexAmp;
		float tempIndexCon = constrain(tempIndexAvg, 0, myAudioMax); 
		// find tempIndexAvg between 0 & 100
		rect( xStart + (i*xSpacing), yStart, rectSize, tempIndexCon);
		myAudioIndexAmp+=myAudioIndexStep;
	}
	myAudioIndexAmp = myAudioIndex;

	stroke(#FF3300); noFill();
	line(stageMargin, stageMargin+myAudioMax, width-stageMargin, stageMargin+myAudioMax);
}

void stop() {
	myAudio.close();
	minim.stop();  
	super.stop();
}




String      pathDATA         = "../../data/";

// *************************************************************************************************************

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim       minim;
AudioPlayer myAudio;
FFT         myAudioFFT;

int         myAudioRange     = 100;
int         myAudioMax       = 100;

float       myAudioAmp       = 30.0;
float       myAudioIndex     = 0.075;
float       myAudioIndexAmp  = myAudioIndex;
float       myAudioIndexStep = 0.05;

// *************************************************************************************************************

int         rectSize         = 5;

int         stageMargin      = 100;
int         myStageW         = (myAudioRange * rectSize) + (stageMargin * 2);
int         myStageH         = 700;
color       clrBG            = #333333;

float       xStart           = stageMargin;
float       yStart           = stageMargin;
int         xSpacing         = rectSize;

// *************************************************************************************************************

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
	// myAudioFFT.window(FFT.NONE);
	myAudioFFT.window(FFT.HAMMING);
}

void draw() {
	// background(clrBG);

	myAudioFFT.forward(myAudio.mix);

	for (int i = 0; i < myAudioRange; ++i) {
		stroke(0); fill(255,5);
		float tempIndexAvg = (myAudioFFT.getAvg(i) * myAudioAmp) * myAudioIndexAmp;
		// float tempIndexCon = constrain(tempIndexAvg, 0, myAudioMax);
		rect( xStart + (i*xSpacing), yStart, rectSize, tempIndexAvg);

		// show lines that visualize the rise of the amp
		// stroke(#40A629); noFill();
		// line(xStart + (i*xSpacing),yStart + ((i*(myAudioAmp+myAudioIndexAmp))/myAudioAmp),xStart + (i*xSpacing) + rectSize, yStart + ((i*(myAudioAmp+myAudioIndexAmp))/myAudioAmp));

		myAudioIndexAmp+=myAudioIndexStep;
	}
	myAudioIndexAmp = myAudioIndex;

	stroke(#FF3300); noFill();
	line(stageMargin, stageMargin+myAudioMax, width-stageMargin, stageMargin+myAudioMax);

	/*
	noStroke(); fill(0);
	rect(stageMargin, (stageMargin/2)-10, width-(stageMargin*2), 20);
	fill(#0095a8); text("range 100 / amp 30.0 / index 0.075 / step 0.05 / window HAMMING", stageMargin+5, (stageMargin/2)+4);

	// when song is done, let's save an image and exit the sketch
	if (!myAudio.isPlaying()) {
		saveFrame("../04_myAudio_VARS.png");
		exit();
	}
	//*/
}

void stop() {
	myAudio.close();
	minim.stop();  
	super.stop();
}




String      pathDATA         = "../../data/";

// *************************************************************************************************************

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim       minim;
AudioPlayer myAudio;
FFT         myAudioFFT;

int         myAudioRange     = 11;
int         myAudioMax       = 100;

float       myAudioAmp       = 40.0;
float       myAudioIndex     = 0.2;
float       myAudioIndexAmp  = myAudioIndex;
float       myAudioIndexStep = 0.35;

// *************************************************************************************************************

int         rectSize         = 50;

int         stageMargin      = 100;
int         myStageW         = (myAudioRange * rectSize) + (stageMargin * 2);
int         myStageH         = 300;
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
	myAudio.loop();

	myAudioFFT = new FFT(myAudio.bufferSize(), myAudio.sampleRate());
	myAudioFFT.linAverages(myAudioRange);
	myAudioFFT.window(FFT.GAUSS);
}

void draw() {
	background(clrBG);

	myAudioFFT.forward(myAudio.mix);

	for (int i = 0; i < myAudioRange; ++i) {
		stroke(0);
		if (i==0)     fill(#237D26); // base
		else if(i==3) fill(#80C41C); // snare
		else          fill(#CCCCCC); // others

		float tempIndexAvg = (myAudioFFT.getAvg(i) * myAudioAmp) * myAudioIndexAmp;
		float tempIndexCon = constrain(tempIndexAvg, 0, myAudioMax);
		rect( xStart + (i*xSpacing), yStart, rectSize, tempIndexCon);

		// visualize the number data for range item
		fill(#0095a8); text(str((int)tempIndexCon), xStart + (i*xSpacing) + 10, stageMargin+myAudioMax+(stageMargin/2));

		myAudioIndexAmp+=myAudioIndexStep;
	}
	myAudioIndexAmp = myAudioIndex;

	stroke(#FF3300); noFill();
	line(stageMargin, stageMargin+myAudioMax, width-stageMargin, stageMargin+myAudioMax);

	noStroke(); fill(0);
	rect(stageMargin, (stageMargin/2)-10, 50, 20);
	fill(#FF3300); text("BASE", stageMargin+5, (stageMargin/2)+4);

	noStroke(); fill(0);
	rect(stageMargin+150, (stageMargin/2)-10, 50, 20);
	fill(#FF6600); text("SNARE", stageMargin+155, (stageMargin/2)+4);
}

void stop() {
	myAudio.close();
	minim.stop();  
	super.stop();
}



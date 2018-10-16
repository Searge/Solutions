
String      pathDATA         = "../../data/";

// *************************************************************************************************************

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

// *************************************************************************************************************

int         rectSize         = 2;

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
	myAudio = minim.loadFile(pathDATA + "HECQ_With_Angels_MP3_320.mp3");
	myAudio.play();

	myAudioFFT = new FFT(myAudio.bufferSize(), myAudio.sampleRate());
	myAudioFFT.linAverages(myAudioRange);
	myAudioFFT.window(FFT.NONE);
}

void draw() {
	// background(clrBG);

	myAudioFFT.forward(myAudio.mix);

	for (int i = 0; i < myAudioRange; ++i) {
		stroke(0); fill(255,5);

		float tempIndexAvg = (myAudioFFT.getAvg(i) * myAudioAmp) * myAudioIndexAmp;
		// float tempIndexCon = constrain(tempIndexAvg, 0, myAudioMax);
		rect( xStart + (i*xSpacing), yStart, rectSize, tempIndexAvg);
		myAudioIndexAmp+=myAudioIndexStep;
	}
	myAudioIndexAmp = myAudioIndex;

	stroke(#FF3300); noFill();
	line(stageMargin, stageMargin+myAudioMax, width-stageMargin, stageMargin+myAudioMax);

	// show audio description
	noStroke(); fill(0);
	rect(stageMargin, (stageMargin/2)-10, 200, 20);
	fill(#CCCCCC); text("MP3 : 44100 / 320 br", stageMargin+5, (stageMargin/2)+4);

	int xPos, yPos; 

	xPos = 567; yPos = stageMargin + myAudioMax + 130;
	stroke(#006600); noFill();
	line(xPos, stageMargin - 10, xPos, yPos); // Bit Rate 320 marker
	noStroke();
	fill(#000000); rect(xPos, yPos + 5, 40, 20);
	fill(#006600); text("320", xPos+5, yPos + 19);

	xPos = 553; yPos = stageMargin + myAudioMax + 100;
	stroke(#009900); noFill();
	line(xPos, stageMargin - 10, xPos, yPos); // Bit Rate 256 marker
	noStroke();
	fill(#000000); rect(xPos, yPos + 5, 40, 20);
	fill(#009900); text("256", xPos+5, yPos + 19);

	xPos = 537; yPos = stageMargin + myAudioMax + 70;
	stroke(#00CC00); noFill();
	line(xPos, stageMargin - 10, xPos, yPos); // Bit Rate 192 marker
	noStroke();
	fill(#000000); rect(xPos, yPos + 5, 40, 20);
	fill(#00CC00); text("192", xPos+5, yPos + 19);

	xPos = 505; yPos = stageMargin + myAudioMax + 40;
	stroke(#0095a8); noFill();
	line(xPos, stageMargin - 10, xPos, yPos); // Bit Rate 160 marker
	noStroke();
	fill(#000000); rect(xPos, yPos + 5, 40, 20);
	fill(#0095a8); text("160", xPos+5, yPos + 19);

	xPos = 487; yPos = stageMargin + myAudioMax + 10;
	stroke(#00FF00); noFill();
	line(xPos, stageMargin - 10, xPos, yPos); // Bit Rate 128 marker
	noStroke();
	fill(#000000); rect(xPos, yPos + 5, 40, 20);
	fill(#00FF00); text("128", xPos+5, yPos + 19);

	// frame.setTitle( str(mouseX) );

	// when song is done, let's save an image and exit the sketch
	// if (!myAudio.isPlaying()) {
		// saveFrame("../01_WAV_44100_16_bps.png");
		// saveFrame("../02_MP3_44100_128_br.png");
		// saveFrame("../03_MP3_44100_160_br.png");
		// saveFrame("../04_MP3_44100_192_br.png");
		// saveFrame("../05_MP3_44100_256_br.png");
		// saveFrame("../06_MP3_44100_320_br.png");
		// exit();
	// }
}

void stop() {
	myAudio.close();
	minim.stop();  
	super.stop();
}



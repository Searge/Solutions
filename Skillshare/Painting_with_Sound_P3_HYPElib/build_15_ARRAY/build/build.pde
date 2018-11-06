
String      pathDATA         = "../../data/";

// ****************************************************************************************

int         myStageW         = 100;
int         myStageH         = 100;

color       clrBG            = #333333;

// ****************************************************************************************

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

float[]     myAudioData      = new float[myAudioRange]; // ARRAY of 11 numbers

// ****************************************************************************************

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
	myAudioDataUpdate(); // Updating the Array ↓
}

void myAudioDataUpdate() {
	for (int i = 0; i < myAudioRange; ++i) {
		float tempIndexAvg = (myAudioFFT.getAvg(i) * myAudioAmp) * myAudioIndexAmp;
		float tempIndexCon = constrain(tempIndexAvg, 0, myAudioMax);
		myAudioData[i]     = tempIndexCon;
		myAudioIndexAmp+=myAudioIndexStep;
	}
	myAudioIndexAmp = myAudioIndex;
/*
                                     
	888~-_   888~-_   888 888b    | ~~~888~~~ 888          
	888   \  888   \  888 |Y88b   |    888    888 888-~88e 
	888    | 888    | 888 | Y88b  |    888    888 888  888 
	888   /  888   /  888 |  Y88b |    888    888 888  888 
	888_-~   888_-~   888 |   Y88b|    888    888 888  888 
	888      888 ~-_  888 |    Y888    888    888 888  888 
                                                       
*/
	println(myAudioData);
}

void stop() {
	myAudio.close();
	minim.stop();  
	super.stop();
}

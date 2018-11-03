
String      pathDATA     = "../../data/";

// ***************************************************************************************

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim       minim;
AudioPlayer myAudio;
FFT         myAudioFFT;

int         myAudioRange = 256;

// ***************************************************************************************

/*

FFT: perform a Fourier Transform on audio data to generate a frequency spectrum.

http://en.wikipedia.org/wiki/Fourier_transform

The Fourier transform decomposes a function of time (a signal) into the frequencies that make it up,
similarly to how a musical chord can be expressed as the amplitude (or loudness) of its constituent
notes. The Fourier transform of a function of time itself is a complex-valued function of frequency,
whose absolute value represents the amount of that frequency present in the original function, and
whose complex argument is the phase offset of the basic sinusoid in that frequency. The Fourier
transform is called the frequency domain representation of the original signal. The term Fourier
transform refers to both the frequency domain representation and the mathematical operation that
associates the frequency domain representation to a function of time. The Fourier transform is not
limited to functions of time, but in order to have a unified language, the domain of the original
function is commonly referred to as the time domain. For many functions of practical interest one
can define an operation that reverses this: the inverse Fourier transformation, also called Fourier
synthesis, of a frequency domain representation combines the contributions of all the different
frequencies to recover the original function of time.

http://en.wikipedia.org/wiki/Fast_Fourier_transform

*/

// ****************************************************************************************

int         rectSize     = 2;

int         stageMargin  = 100;
int         myStageW     = (myAudioRange * rectSize) + (stageMargin * 2);
int         myStageH     = 300;
color       clrBG        = #333333;
float       xStart       = stageMargin;
float       yStart       = stageMargin;
int         xSpacing     = rectSize;

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
	// bufferSize = 1024 / sampleRate = 44100.0
	myAudioFFT.linAverages(myAudioRange); 
	// calculate the averages by grouping frequency bands linearly. use 256 averages.
}

void draw() {
	background(clrBG);

	// perform a forward FFT on the samples in the audio's mix buffer
	// note that if the audio were a MONO file, this would be the same as using audio.left or audio.right
	myAudioFFT.forward(myAudio.mix);

	for (int i = 0; i < myAudioRange; ++i) {
		stroke(0); fill(255);

		// since linear averages group equal numbers of adjacent frequency bands
		// we can simply precalculate how many pixel wide/high each average's 
		// ellipse should be.

		float tempIndexAvg = myAudioFFT.getAvg(i);
		rect( xStart + (i*xSpacing), yStart, rectSize, tempIndexAvg);
	}

	stroke(#FF3300); noFill();
	line(stageMargin, stageMargin+100, width-stageMargin, stageMargin+100);
}

void stop() {
	myAudio.close();
	minim.stop();  
	super.stop();
}



import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.colorist.HColorPool;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HColorPool colors;
HRect r1;

int startScale = 450;
int scaleOffset = 10;

// ***************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #ff3300, #ff3300, #242424, #333333, #666666);

	for (int i=0; i<40; ++i) {

		r1 = new HRect().rounding(20);
		r1
			.size(startScale) // Start Scale -- 450
			.noStroke()
			.fill( colors.getColor() )
			.loc(myStageW/2,myStageH/2)
			.anchorAt(H.CENTER) // SUPERIMPORTANT
			.rotation(45)
		;
		H.add(r1);
		
		// w/o Oscillator that for-loop just attached 40 things
		// & randomly grabbed a color in the color pool
		new HOscillator() 
			.target(r1)
			.property(H.ROTATION)
			.relativeVal( 45 ) // which is that initial rotation that we set in `r1`
			.range(-20, 20) // <- right/left
			.speed(0.4)
			.freq(8)
			.currentStep(i) // Stepping by 1 each time
		;

		startScale -= scaleOffset; // 10 -= 450
		// after it runs for the first time & attaches the 1st HRect @450 for the size
		// `startScale` starts to decrease in size down BY TEN: 450 -> 440 -> 430 ...
	}
}

void draw() {
	H.drawStage();
}


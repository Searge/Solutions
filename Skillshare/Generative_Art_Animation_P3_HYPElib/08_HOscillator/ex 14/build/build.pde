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
			.size(startScale)
			.noStroke()
			.fill( colors.getColor() )
			.loc(myStageW/2,myStageH/2)
			.anchorAt(H.CENTER)
			.rotation(45)
		;
		H.add(r1);

		new HOscillator()
			.target(r1)
			.property(H.ROTATION)
			.relativeVal( 45 )
			.range(-20, 20)
			.speed(0.4)
			.freq(8)
			.currentStep(i)
		;

		new HOscillator()
			.target(r1)
			.property(H.SCALE)
			.range(0.5, 1.5)
			.speed(0.4)
			.freq(8)
			.currentStep(i)
		;

		new HOscillator()
			.target(r1)
			.property(H.Y)
			.relativeVal( r1.y() )
			.range(-50, 50)
			.speed(0.4)
			.freq(8)
			.currentStep(i)
		;

		new HOscillator()
			.target(r1)
			.property(H.X) // COPIED from `H.Y`
			.relativeVal( r1.x() )
			.range(-50, 50)
			.speed(0.4)
			.freq(8)
			.currentStep(i)
		;

		startScale -= scaleOffset;
	}
}

void draw() {
	H.drawStage();
}


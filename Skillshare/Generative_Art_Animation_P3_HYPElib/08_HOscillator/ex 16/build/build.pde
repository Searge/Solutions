import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.colorist.HColorPool;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HColorPool colors;
HRect r1;

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(true);

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #ff3300, #ff3300, #242424, #333333, #666666);

	// attaching 100 things on screen:
	for (int i=0; i<100; ++i) {

		r1 = new HRect().rounding(20);
		r1
			.size(100)
			.noStroke()
			.fill( colors.getColor() )
			.loc(myStageW/2,myStageH/2)
			.anchor(50,-50)
		;
		H.add(r1);

		new HOscillator()
			.target(r1)
			.property(H.ROTATION)
			.range(-180, 180) // <--
			.speed(0.1)
			.freq(4)
			.currentStep(i)
		;

		new HOscillator()
			.target(r1)
			.property(H.SCALE)
			.range(0.25, 1)
			.speed(1)
			.freq(4)
			.currentStep(i*3)
		;

		new HOscillator()
			.target(r1)
			.property(H.Y)
			.relativeVal( r1.y() )
			.range(-150, 150) // BIGGER Oscillation
			.speed(0.5)
			.freq(2) // different frequency
			.currentStep(i)
		;

		new HOscillator()
			.target(r1)
			.property(H.X)
			.relativeVal( r1.x() )
			.range(-150, 150) // BIGGER Oscillation
			.speed(0.5)
			.freq(1) // different frequency
			.currentStep(i)
		;
	}
}

void draw() {
	H.drawStage();
}


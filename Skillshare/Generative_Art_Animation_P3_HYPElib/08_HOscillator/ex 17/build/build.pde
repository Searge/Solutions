import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.colorist.HColorPool;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HCanvas c1; // <- HCanvas
HColorPool colors;
HRect r1;

// ***************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(true);

	c1 = new HCanvas().autoClear(false).fade(2);
	H.add(c1);

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095A8, #00616F, #FF3300, #FF6600);

	// attaching 200 things on screen:
	for (int i=0; i<200; ++i) {

		r1 = new HRect().rounding(20);
		r1
			.size(100)
			.noStroke()
			.fill( colors.getColor( i*250 ) )
			// getting random color off of `HColorPool`
			// but doing a seed here -- `i*250`
			// creates interesting banding
			.loc(myStageW/2,myStageH/2)
			.anchor(50,-50) // oscillation is now going off of artwork
		;
		c1.add(r1);

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
			.range(0.25, 1) // 25% to 100% of original size
			.speed(1)
			.freq(4)
			.currentStep(i*3) // more pulses
		;

		new HOscillator()
			.target(r1)
			.property(H.Y)
			.relativeVal( r1.y() )
			.range(-300, 300) // BIGGER AGAIN
			.speed(0.5)
			.freq(2)
			.currentStep(i)
		;

		new HOscillator()
			.target(r1)
			.property(H.X)
			.relativeVal( r1.x() )
			.range(-300, 300) // BIGGER AGAIN
			.speed(0.5)
			.freq(1)
			.currentStep(i)
		;
	}
}

void draw() {
	H.drawStage();
}


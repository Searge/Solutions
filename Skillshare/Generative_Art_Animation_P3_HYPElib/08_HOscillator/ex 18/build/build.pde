import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.colorist.HColorPool;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HCanvas c1;
HColorPool colors;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(true);

	c1 = new HCanvas().autoClear(false);
	H.add(c1);

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095A8, #00616F, #FF3300, #FF6600);

	for (int i=0; i<100; ++i) {

		HPath d = new HPath();
		d
			.star(5, 0.4, -90)
			.size(200)

			.stroke( colors.getColor( i*250 ) )
			.fill(#000000)
			.anchorAt(H.CENTER)
			.loc(myStageW/2,myStageH/2)
		;
		c1.add(d);

		new HOscillator()
			.target(d)
			.property(H.ROTATION)
			.range(-180, 180)
			.speed(1)
			.freq(0.5)
			.currentStep(i)
		;

		new HOscillator()
			.target(d)
			.property(H.SCALE)
			.range(0.25, 1)
			.speed(2)
			.freq(4)
			.currentStep(i)
		;

		new HOscillator()
			.target(d)
			.property(H.Y)
			.relativeVal( d.y() )
			.range(-500, 500)
			.speed(1)
			.freq(0.7)
			.currentStep(i)
		;

		new HOscillator()
			.target(d)
			.property(H.X)
			.relativeVal( d.x() )
			.range(-500, 500)
			.speed(2)
			.freq(0.5)
			.currentStep(i)
		;
	}
}

void draw() {
	H.drawStage();
}


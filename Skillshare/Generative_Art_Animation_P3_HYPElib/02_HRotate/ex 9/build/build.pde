import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.behavior.HRotate;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HRect r1, r2, r3;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(false);

	r1 = new HRect(100).rounding(10);
	H.add(r1)
		.anchor(50,150)
		.loc(myStageW/2,myStageH/2)
		.stroke(#FF3300)
		.fill(#202020)
	;

	r2 = new HRect(100).rounding(10);
	H.add(r2)
		.anchor(50,200)
		.loc(myStageW/2,myStageH/2)
		.stroke(#FF3300)
		.fill(#202020)
	;

	r3 = new HRect(100).rounding(10);
	H.add(r3)
		.anchor(50,250)
		.loc(myStageW/2,myStageH/2)
		.stroke(#FF3300)
		.fill(#202020)
	;

	new HRotate(r1, 1);
	new HRotate(r2, 2);
	new HRotate(r3, -3);

	new HOscillator().target(r1).property(H.SCALE).range(0, 1).speed(0.5).freq(5);
	new HOscillator().target(r2).property(H.SCALE).range(-1, 1).speed(0.5).freq(5);
	new HOscillator().target(r3).property(H.SCALE).range(0, 2).speed(0.5).freq(5);
}

void draw() {
	H.drawStage();
}


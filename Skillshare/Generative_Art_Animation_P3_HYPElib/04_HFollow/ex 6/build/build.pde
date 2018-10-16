import hype.*;
import hype.extended.colorist.HPixelColorist;
import hype.extended.behavior.HFollow;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HCanvas c1;
HPixelColorist colors;
HFollow mf;
HRect r1;

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(true);

	c1 = new HCanvas().autoClear(false).fade(4);
	H.add(c1);

	colors = new HPixelColorist("sintra.jpg").fillOnly();

	r1 = new HRect(100).rounding(40);
	r1
		.strokeWeight(2)
		.stroke(#000000, 150)
		.fill(#111111)
		.loc(myStageW/2,myStageH/2)
		.anchorAt(H.CENTER)
		.rotation(45)
	;
	c1.add(r1);

	mf = new HFollow()
		.target(r1)
		.ease(0.05)
		.spring(0.95)
	;
}

void draw() {
	colors.applyColor(r1);

	H.drawStage();
}


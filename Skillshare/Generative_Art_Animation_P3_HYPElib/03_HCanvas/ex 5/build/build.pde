import hype.*;
import hype.extended.behavior.HRotate;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HCanvas c1, c2, c3;
HRect r1, r2, r3;

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	c1 = new HCanvas().autoClear(true);
	c2 = new HCanvas().autoClear(false).fade(8);
	c3 = new HCanvas().autoClear(false).fade(2);

	// each rectangle painting on separete Canvas
	H.add(c1);
	H.add(c2);
	H.add(c3);

	r1 = new HRect(100).rounding(10);
	c1.add(r1)
		.loc(myStageW/2 - 160,myStageH/2)
		.noStroke()
		.fill(#FF3300)
	;

	r2 = new HRect(100).rounding(10);
	c2.add(r2)
		.loc(myStageW/2,myStageH/2)
		.noStroke()
		.fill(#0095a8)
	;

	r3 = new HRect(100).rounding(10);
	c3.add(r3)
		.loc(myStageW/2 + 160,myStageH/2)
		.noStroke()
		.fill(#6666FF)
	;

	new HRotate(r1, 2);
	new HRotate(r2, 2);
	new HRotate(r3, 2);
}

void draw() {
	H.drawStage();
}

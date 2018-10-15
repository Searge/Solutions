import hype.*;
import hype.extended.behavior.HRotate;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HCanvas c1;
HRect r1;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	c1 = new HCanvas().autoClear(false).fade(4);
	H.add(c1);

	r1 = new HRect(100).rounding(10);
	c1.add(r1)
		.anchor(50,125)
		.loc(myStageW/2,myStageH/2)
		.noStroke()
		.fill(#FF3300)
	;

	new HRotate(r1, 2);
}

void draw() {
	H.drawStage();
}


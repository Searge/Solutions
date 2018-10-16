import hype.*;
import hype.extended.behavior.HRotate;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HCanvas c1; // 𝓒𝓪𝓷𝓿𝓪𝑠 ⑴
HRect r1;

// *************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	c1 = new HCanvas().autoClear(false).fade(4); // 𝙁𝘼𝘿𝙀
	H.add(c1);

	r1 = new HRect(100).rounding(10);
	c1.add(r1) // DON'T ADD this to the stage `H`; add this to CANVAS `c1`
	// NO `H.add(r1)` IT'S `c1.add(r1)`
		.anchor(50,125)
		.loc(myStageW/2,myStageH/2)
		.noStroke()
		.fill(#FF3300)
	;
	// we're actually pinting the rectangle into the HCanvas
	new HRotate(r1, 2);
	// Rotating inside of Canvas, over the Stage
}

void draw() {
	H.drawStage();
}


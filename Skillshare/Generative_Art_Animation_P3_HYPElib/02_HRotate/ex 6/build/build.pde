import hype.*;
import hype.extended.behavior.HRotate;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HRect r1, r2, r3;

// *************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	r1 = new HRect(100).rounding(10);
	H.add(r1)
		.anchorAt(H.CENTER_TOP) // LOOK @ HConstants.pde inside of Example folder
		.loc(myStageW/2 - 160,myStageH/2)
		.noStroke()
		.fill(#FF3300)
	;

	r2 = new HRect(100).rounding(10);
	H.add(r2)
		.anchorAt(H.CENTER)
		.loc(myStageW/2,myStageH/2)
		.noStroke()
		.fill(#FF6600)
	;

	r3 = new HRect(100).rounding(10);
	H.add(r3)
		.anchorAt(H.BOTTOM_RIGHT)
		.loc(myStageW/2 + 160,myStageH/2)
		.noStroke()
		.fill(#FF9900)
	;

	new HRotate(r1, 0.5);
	new HRotate(r2, 1);
	new HRotate(r3, 1.5);
}

void draw() {
	H.drawStage();

	noFill(); strokeWeight(2); stroke(#0095a8);
	ellipse(r1.x(), r1.y(), 4, 4);
	ellipse(r2.x(), r2.y(), 4, 4);
	ellipse(r3.x(), r3.y(), 4, 4);
}


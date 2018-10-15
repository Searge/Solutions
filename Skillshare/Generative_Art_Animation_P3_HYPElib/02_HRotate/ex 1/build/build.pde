import hype.*;
import hype.extended.behavior.HRotate;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HRect r1;

// ****************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	r1 = new HRect(100).rounding(10);
	H.add(r1)
		.loc(myStageW/2,myStageH/2)
		.noStroke()
		.fill(#FF3300)
		// if you don't specify anchor
		// then you're rotating off of 0 X, 0 Y
		// it put it in the UPPER LEFT corner
	;

	HRotate hr1 = new HRotate();
	hr1.target(r1).speed(-0.5); // 2 degrees at a time
	// speed can be a positive nuber, it's float
	// so you could slowdown animation
	// & make counterclockwise by using negative numbers
}

void draw() {
	H.drawStage();

	noFill(); strokeWeight(2); stroke(#0095a8);
	ellipse(r1.x(), r1.y(), 4, 4);
	// X & Y position of ellipse is what X & Y position of r1
}

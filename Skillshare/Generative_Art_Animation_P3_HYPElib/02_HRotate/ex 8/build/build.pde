import hype.*;
import hype.extended.behavior.HRotate;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HRect r1, r2;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	r1 = new HRect(100).rounding(10);
	H.add(r1)
		.anchor(50, -50)
		.loc(myStageW/2,myStageH/2)
		.noStroke()
		.fill(#FF3300)
	;

	r2 = new HRect(50).rounding(10);
	r1.add(r2)
		.anchor(25, -25)
		.noStroke()
		.fill(#00616f)
	;

	new HRotate(r1, 1);
}

void draw() {
	H.drawStage();

	noFill(); strokeWeight(2); stroke(#0095a8);
	ellipse(r1.x(), r1.y(), 4, 4);
}


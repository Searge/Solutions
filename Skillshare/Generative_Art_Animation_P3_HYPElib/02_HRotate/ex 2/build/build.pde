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
	;

	/*
	 * There is also a radians version
	 * of the speed() method:
	 */
	 
	HRotate hr1 = new HRotate();
	hr1.target(r1).speedRad(-TWO_PI/90);
	// the only difference in exmp 2 that `speedRad`
	// going to give you rotation in radians
}

void draw() {
	H.drawStage();

	noFill(); strokeWeight(2); stroke(#0095a8);
	ellipse(r1.x(), r1.y(), 4, 4);
}


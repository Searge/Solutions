import hype.*;
import hype.extended.behavior.HFollow;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HFollow mf;
HRect r1;

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(true);

	r1 = new HRect(100).rounding(40);
	r1
		.noStroke()
		.fill(#ECECEC)
		.loc(myStageW/2,myStageH/2)
		.anchorAt(H.CENTER)
		.rotation(45)
	;
	H.add(r1);

	// HFollow / ease and spring

	mf = new HFollow()
		.target(r1)
		.ease(0.1)
		.spring(0.95) // to get some elasticity 
	;
}

void draw() {
	H.drawStage();
}


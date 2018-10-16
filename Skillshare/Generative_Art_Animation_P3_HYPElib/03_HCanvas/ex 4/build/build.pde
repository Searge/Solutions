import hype.*;
import hype.extended.behavior.HRotate;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HRect r1, r2, r3;

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(false);

	r1 = new HRect(100).rounding(10);
	H.add(r1)
		.loc(myStageW/2 - 160,myStageH/2)
		.noStroke()
		.fill(#FF3300)
	;

	r2 = new HRect(100).rounding(10);
	H.add(r2)
		.loc(myStageW/2,myStageH/2)
		.noStroke()
		.fill(#0095a8)
	;

	r3 = new HRect(100).rounding(10);
	H.add(r3)
		.loc(myStageW/2 + 160,myStageH/2)
		.noStroke()
		.fill(#6666FF)
	;

	new HRotate(r1, 2);
	new HRotate(r2, 2);
	new HRotate(r3, 2);
}

void draw() {
	fill(#202020,10);
	rect(0,0,myStageW,myStageH);

	H.drawStage();
}

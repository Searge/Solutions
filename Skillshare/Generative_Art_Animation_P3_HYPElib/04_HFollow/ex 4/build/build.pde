import hype.*;
import hype.extended.colorist.HColorPool;
import hype.extended.behavior.HFollow;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HColorPool colors;
HFollow mf;
HRect r1;

// *************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(false);

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);

	r1 = new HRect(100).rounding(40);
	r1
		.strokeWeight(2)
		.fill(#111111)
		.loc(myStageW/2,myStageH/2)
		.anchorAt(H.CENTER)
		.rotation(45)
	;
	H.add(r1);

	mf = new HFollow()
		.target(r1)
		.ease(0.05)
		.spring(0.95)
	;
}

void draw() {
	r1.stroke( colors.getColor() ); // get randomly color out of HColorPool

	H.drawStage();
}

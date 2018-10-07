import hype.*;
import hype.extended.colorist.HColorPool;

int myStageW = 900;
int myStageH = 900;

color clrBG = #ECECEC;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup() {
	H.init(this).background(clrBG);

	HColorPool colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);

	HShape d = new HShape("mongo.svg");
	H.add(d)
		.strokeWeight(0.5)
		.stroke(#000000)
		.anchorAt(H.CENTER)
		.loc(myStageW/2,myStageH/2)
		.scale(3)
	;

	d.randomColors( colors.fillOnly() );

	H.drawStage();
}
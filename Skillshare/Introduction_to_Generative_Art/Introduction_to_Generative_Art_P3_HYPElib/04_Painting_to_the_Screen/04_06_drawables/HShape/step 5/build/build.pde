import hype.*;
import hype.extended.colorist.HColorPool;

int myStageW = 600;
int myStageH = 600;

color clrBG = #FFFFFF;

HShape d;
HColorPool colors;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);

	for (int i = 0; i<15; i++){
		d = new HShape("vectors.svg");
		d
			.enableStyle(false)
			.stroke(#111111)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.rotation( (int)random(360) )
			.size( (int)random(200,500) )
			.loc( (int)random(myStageW), (int)random(myStageH) )
			.anchorAt(H.CENTER)
		;
		d.randomColors( colors.fillOnly() );
		H.add(d);
	}

	H.drawStage();
}

import hype.*;
import hype.extended.colorist.HColorPool;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HRect d;
HColorPool colors;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);

	for (int i = 0; i<100; i++){
		d = new HRect();
		d
			.strokeWeight(1)
			.stroke(#000000)
			.fill( colors.getColor() )
			.size( (int)random(25,125) )
			.rotate( (int)random(360) )
			.loc( (int)random(myStageW), (int)random(myStageH) )
			.anchorAt(H.CENTER)
		;
		H.add(d);
	}

	H.drawStage();
}

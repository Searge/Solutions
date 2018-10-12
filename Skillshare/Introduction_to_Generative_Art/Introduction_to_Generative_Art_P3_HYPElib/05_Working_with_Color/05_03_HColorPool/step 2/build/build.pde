import hype.*;
import hype.extended.colorist.HColorPool;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HRect d;
HColorPool colors;

// **********************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);
	// what we want do: is add this idea of color waiting
	// dow to you add weight to specific colors more then others?
	colors = new HColorPool()
		// adding colors manually & telling
		// how many of them we want to store
		.add(#FFFFFF)
		.add(#ECECEC,9)
		.add(#CCCCCC,9)
		.add(#333333,3)
		.add(#0095a8,2)
		.add(#00616f,2)
		.add(#FF3300,6)
		.add(#FF6600)
	;

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

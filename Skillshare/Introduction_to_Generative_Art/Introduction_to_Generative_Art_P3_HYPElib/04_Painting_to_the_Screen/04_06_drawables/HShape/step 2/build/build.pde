import hype.*;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HShape d;

// *********************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	for (int i = 0; i<25; i++){
		d = new HShape("vectors.svg");
		// DON'T MAKE/START COMPLECS VECTORS
		d
			.enableStyle(false)
			.strokeWeight(2)
			.stroke(#111111)
			.fill(#FF3300)
			.size( (int)random(150,300) )
			.loc( (int)random(myStageW), (int)random(myStageH) )
			.anchorAt(H.CENTER)
		;
		H.add(d);
	}

	H.drawStage();
}

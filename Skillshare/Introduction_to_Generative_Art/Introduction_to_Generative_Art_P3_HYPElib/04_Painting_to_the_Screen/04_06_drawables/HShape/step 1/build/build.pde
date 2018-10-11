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

	for (int i = 0; i<100; i++){
		d = new HShape("vectors.svg");
		// d for Drawable
		d
			.enableStyle(false)
			// don't use the styling
			// that I used in Illustrator
			.strokeWeight(1)
			.stroke(#FF3300)
			.fill(#111111)
			.size( (int)random(25,100) )
			.rotate( (int)random(360) )
			.loc( (int)random(myStageW), (int)random(myStageH) )
			.anchorAt(H.CENTER)
		;
		H.add(d);
	}

	H.drawStage();
}

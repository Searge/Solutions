import hype.*;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HBox d;

// ***********************************************************************************

void settings() {
	size(myStageW,myStageH,P3D);
}

void setup(){
	H.init(this).background(clrBG).use3D(true);

	for (int i = 0; i<100; i++){
		d = new HBox();
		d
			.depth( (int)random(25,125) )
			.width( (int)random(25,125) )
			.height( (int)random(25,125) )
			.strokeWeight(1)
			.stroke(#FF3300)
			.fill(#111111)
			.loc( (int)random(myStageW), (int)random(myStageH), (int)random(-100,100) )
			.anchorAt(H.CENTER)
		;

		H.add(d);
	}

	H.drawStage();
}

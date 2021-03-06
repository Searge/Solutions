import hype.*;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HRect d;

// *******************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	for (int i = 0; i<100; i++){
		d = new HRect();
		d
			.strokeWeight(1)
			.stroke(#FF3300)
			.fill(#111111)
			.size( (int)random(25,125) )
			.rotate( (int)random(360) )
			.loc( (int)random(myStageW), (int)random(myStageH) )
			.anchorAt(H.CENTER)
		;
		H.add(d);
	}

	H.drawStage();
}

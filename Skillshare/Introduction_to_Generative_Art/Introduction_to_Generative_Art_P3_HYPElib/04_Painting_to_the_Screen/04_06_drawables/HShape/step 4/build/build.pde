import hype.*;

int myStageW = 600;
int myStageH = 600;

color clrBG = #FFFFFF;

HShape d;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	for (int i = 0; i<15; i++){
		d = new HShape("vectors.svg");
		d
			.enableStyle(false)
			.stroke(#111111)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.fill( (int)random(255) )
			.rotation( (int)random(360) )
			.size( (int)random(200,400) )
			.loc( (int)random(myStageW), (int)random(myStageH) )
			.anchorAt(H.CENTER)
		;
		H.add(d);
	}

	H.drawStage();
}

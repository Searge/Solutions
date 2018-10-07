import hype.*;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HImage d;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	for (int i = 0; i<100; i++){
		d = new HImage("deadmau5.jpg");
		d
			.size( (int)random(75,175) )
			.rotate( (int)random(360) )
			.alpha( (int)random(50,255) )
			.loc( (int)random(myStageW), (int)random(myStageH) )
			.anchorAt(H.CENTER)
		;
		H.add(d);
	}

	H.drawStage();
}

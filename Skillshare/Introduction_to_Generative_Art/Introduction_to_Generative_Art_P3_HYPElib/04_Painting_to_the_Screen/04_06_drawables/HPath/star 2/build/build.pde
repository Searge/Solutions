import hype.*;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HPath d;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup() {
	H.init(this).background(clrBG);

	for (int i = 0; i<100; i++){
		d = new HPath();
		d
			.star( round(random(5, 10)), random(0.25, 0.75) )
			.strokeWeight(1)
			.stroke(#FF3300)
			.fill(#111111)
			.size( (int)random(50,200) )
			.rotate( (int)random(360) )
			.loc( (int)random(myStageW), (int)random(myStageH) )
			.anchorAt(H.CENTER)
		;
		H.add(d);
	}

	H.drawStage();
}

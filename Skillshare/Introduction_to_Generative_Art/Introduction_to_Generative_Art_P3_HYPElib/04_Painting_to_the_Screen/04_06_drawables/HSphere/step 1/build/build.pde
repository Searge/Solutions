import hype.*;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HSphere d;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH,P3D);
}

void setup(){
	H.init(this).background(clrBG).use3D(true);

	for (int i = 0; i<100; i++){
		d = new HSphere();
		d
			.size( (int)random(40,80) )
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

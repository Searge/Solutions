import hype.*;
import hype.extended.colorist.HPixelColorist;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HRect d;
HPixelColorist colors;

// *********************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	colors = new HPixelColorist("kelp.jpg").strokeOnly();
		// changing from fillOnly() to strokeOnly()

	for (int i = 0; i<100; i++){
		d = new HRect();
		d
			.strokeWeight(3)
			.fill(#111111)
			// remove stroke() and specify fill()
			.size( (int)random(25,125) )
			.rotate( (int)random(360) )
			.loc( (int)random(myStageW), (int)random(myStageH) )
			.anchorAt(H.CENTER)
		;
		colors.applyColor(d);
		H.add(d);
	}

	H.drawStage();
}

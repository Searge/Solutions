import hype.*;
import hype.extended.colorist.HColorField;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HRect d;
HColorField colors;

// **********************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	colors = new HColorField(myStageW,myStageH)
		.addPoint(0, myStageH/2, #FF3300, 0.3)
		// for 1 ↑ on the LEFT, X-axis is 0, but height still / by 2
		.addPoint(myStageW, myStageH/2, #0095a8, 0.3)
		// for the RIGHT position is WIDTH (so now it's on END of Canvas)
		.fillOnly()
	;

	for (int i = 0; i<100; i++){
		d = new HRect();
		d
			.noStroke()
			.fill(#000000)
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

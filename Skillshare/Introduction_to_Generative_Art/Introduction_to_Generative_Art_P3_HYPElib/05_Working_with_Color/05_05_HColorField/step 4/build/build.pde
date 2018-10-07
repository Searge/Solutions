import hype.*;
import hype.extended.colorist.HColorField;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HRect d;
HColorField colors;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	colors = new HColorField(myStageW,myStageH)
		.addPoint(0, myStageH/2, #FF3300, 0.5)        // orange
		.addPoint(myStageW, myStageH/2, #0095a8, 0.5) // teal

		.addPoint(myStageW/2, 0, #FFFF00, 0.3)        // yellow
		.addPoint(myStageW/2, myStageH, #00FF00, 0.3) // green		
		.fillAndStroke()
	;

	for (int i = 0; i<100; i++){
		d = new HRect();
		d
			.strokeWeight(2)
			.stroke(#000000)
			.fill(#000000, 100)
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

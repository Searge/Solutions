import hype.*;
import hype.extended.colorist.HColorField;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HRect d;
HColorField colors;

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	colors = new HColorField(myStageW,myStageH)
		// u have to specify WHAT the WIDTH & HEIGHT of the field is…
		.addPoint(myStageW/2, myStageH/2, #FF3300, 0.3)
		// point in the exact center of the screen
		// 1st args is position of the poin X, Y
		// 3rd is the color that u want to use
		// 4th is the radius of gradient
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
		// ↑ AS IN PixelColorist
		H.add(d);
	}

	H.drawStage();
}

import hype.*;
import hype.extended.colorist.HColorPool;
import processing.pdf.*;

int myStageW = 600;
int myStageH = 600;

color clrBG = #FFFFFF;

HShape d;
HColorPool colors;

boolean record = false;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);

	for (int i = 0; i<15; i++){
		d = new HShape("vectors.svg");
		d
			.enableStyle(false)
			.stroke(#111111)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.rotation( (int)random(360) )
			.size( (int)random(200,500) )
			.loc( (int)random(myStageW), (int)random(myStageH) )
			.anchorAt(H.CENTER)
		;
		d.randomColors( colors.fillOnly() );
		H.add(d);
	}
}

void draw() {
	PGraphics tmp = null;

	if (record) {
		tmp = beginRecord(PDF, "render-######.pdf");
	}

	if (tmp == null) {
		H.drawStage();
	} else {
		PGraphics g = tmp;
		boolean uses3D = false;
		float alpha = 1;
		H.stage().paintAll(g, uses3D, alpha);
	}

	if (record) {
		endRecord();
		record = false;
	}
}

void keyPressed() {
	if (key == 's') {
		record = true;
		draw();
	}
}

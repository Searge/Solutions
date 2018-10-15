 import hype.*;
import hype.extended.layout.HGridLayout;

int myStageW = 600;
int myStageH = 600;

color clrBG = #FFFFFF;

HDrawablePool dp1;
// Drawable pool 1 
// *************************************************************************************** 

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	dp1 = new HDrawablePool(88);
	// draw 88 items
	dp1.autoAddToStage()
		.add (new HShape("hexagon.svg")) // specified what we want to use
		.layout (new HGridLayout().startX(27).startY(40).spacing(78,51).cols(8))
		// GridLayout: start on 27 X & 40 Y; spacing 78 X, 51 Y & has 8 columns
		.onCreate (new HCallback() {public void run(Object obj) {
			HShape d = (HShape) obj;
			d.enableStyle(false).noStroke().fill(#4D4D4D).anchorAt(H.CENTER);
			// kill styling from Illustrator; kill stroke; fill color & anchor at the Center
		}}).requestAll();

	H.drawStage();
}



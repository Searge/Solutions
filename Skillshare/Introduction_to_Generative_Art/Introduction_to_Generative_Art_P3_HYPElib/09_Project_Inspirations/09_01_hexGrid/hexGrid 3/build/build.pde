import hype.*;
import hype.extended.colorist.HPixelColorist;
import hype.extended.layout.HGridLayout;

int myStageW = 600;
int myStageH = 600;

color clrBG = #FFFFFF;

HDrawablePool dp1, dp2, dp3;
HPixelColorist cp1; // we want to steal color from actually a gradient jpg

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	cp1 = new HPixelColorist("gradient.jpg").fillOnly();

	dp1 = new HDrawablePool(88);
	dp1.autoAddToStage()
		.add (new HShape("hexagon.svg"))
		.layout (new HGridLayout().startX(27).startY(40).spacing(78,51).cols(8))
		.onCreate (new HCallback() {public void run(Object obj) {
			HShape d = (HShape) obj;
			d.enableStyle(false).noStroke().fill(#4D4D4D).anchorAt(H.CENTER);
		}}).requestAll();

	dp2 = new HDrawablePool(70);
	dp2.autoAddToStage()
		.add (new HShape("hexagon.svg"))
		.layout (new HGridLayout().startX(66).startY(65).spacing(78,51).cols(7))
		.onCreate (new HCallback() {public void run(Object obj) {
			HShape d = (HShape) obj;
			d.enableStyle(false).noStroke().fill(#FF3300).anchorAt(H.CENTER);
		}}).requestAll();

	dp3 = new HDrawablePool(70);
	dp3.autoAddToStage()
		.add (new HShape("hexagon.svg"))
		.layout (new HGridLayout().startX(66).startY(65).spacing(78,51).cols(7))
		// on top of second grid but using each pixel colorist
		// to transition from white up at the top towards black bottom
		.onCreate (new HCallback() {public void run(Object obj) {
			HShape d = (HShape) obj;
			d.enableStyle(false).size(40).noStroke().anchorAt(H.CENTER);
			cp1.applyColor(d);
		}}).requestAll();

	H.drawStage();
}



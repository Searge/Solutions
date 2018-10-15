import hype.*;
import hype.extended.colorist.HColorPool;
import hype.extended.colorist.HPixelColorist;
import hype.extended.layout.HGridLayout;

int myStageW = 600;
int myStageH = 600;

color clrBG = #FFFFFF;

HDrawablePool dp1, dp2, dp3, dp4, dp5, dp6;
HPixelColorist cp1;
HColorPool cp2;

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	cp1 = new HPixelColorist("gradient.jpg").fillOnly();
	cp2 = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600).fillOnly();

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
		.onCreate (new HCallback() {public void run(Object obj) {
			HShape d = (HShape) obj;
			d.enableStyle(false).size(40).noStroke().anchorAt(H.CENTER);
			cp1.applyColor(d);
		}}).requestAll();

	dp4 = new HDrawablePool(70);
	dp4.autoAddToStage()
		.add (new HShape("hexagon.svg"))
		.layout (new HGridLayout().startX(66).startY(65).spacing(78,51).cols(7))
		.onCreate (new HCallback() {public void run(Object obj) {
			HShape d = (HShape) obj;
			d.enableStyle(false).size(20).noStroke().anchorAt(H.CENTER);
			cp2.applyColor(d);
		}}).requestAll();

	dp5 = new HDrawablePool(88);
	dp5.autoAddToStage()
		.add (new HShape("hexagon.svg"))
		.layout (new HGridLayout().startX(27).startY(40).spacing(78,51).cols(8))
		.onCreate (new HCallback() {public void run(Object obj) {
			HShape d = (HShape) obj;
			d.enableStyle(false).size(40).noStroke().anchorAt(H.CENTER);
			cp2.applyColor(d);
		}}).requestAll();

	dp6 = new HDrawablePool(88); // Copy of dp5
	dp6.autoAddToStage()
		.add (new HShape("hexagon.svg"))
		.layout (new HGridLayout().startX(27).startY(40).spacing(78,51).cols(8))
		.onCreate (new HCallback() {public void run(Object obj) {
			HShape d = (HShape) obj;
			d.enableStyle(false).size(25).noStroke().anchorAt(H.CENTER);
			// size to 25
			cp1.applyColor(d);
			// using gradient from PixelColorist
		}}).requestAll();

	H.drawStage();
}



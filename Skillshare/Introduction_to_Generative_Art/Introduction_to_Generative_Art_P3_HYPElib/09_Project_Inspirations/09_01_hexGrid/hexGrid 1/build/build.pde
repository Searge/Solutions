import hype.*;
import hype.extended.layout.HGridLayout;

int myStageW = 600;
int myStageH = 600;

color clrBG = #FFFFFF;

HDrawablePool dp1;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	dp1 = new HDrawablePool(88);
	dp1.autoAddToStage()
		.add (new HShape("hexagon.svg"))
		.layout (new HGridLayout().startX(27).startY(40).spacing(78,51).cols(8))
		.onCreate (new HCallback() {public void run(Object obj) {
			HShape d = (HShape) obj;
			d.enableStyle(false).noStroke().fill(#4D4D4D).anchorAt(H.CENTER);
		}}).requestAll();

	H.drawStage();
}



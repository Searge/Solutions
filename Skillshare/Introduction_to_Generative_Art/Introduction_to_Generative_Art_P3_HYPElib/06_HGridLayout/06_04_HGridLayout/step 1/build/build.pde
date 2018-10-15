import hype.*;
import hype.extended.colorist.HColorPool;
import hype.extended.layout.HGridLayout;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HDrawablePool pool;
HColorPool colors;

// ***************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);

	pool = new HDrawablePool(121);
	pool.autoAddToStage()
		.add(new HShape("svg1.svg"), 11)
		.add(new HShape("svg2.svg"))
		.add(new HShape("svg3.svg"))
		.add(new HShape("svg4.svg"))
		.add(new HShape("svg5.svg"))
		.add(new HShape("svg6.svg"), 22)

		.layout(
			new HGridLayout()
			// where GridLayout start
			.startX(25) // this is the starting position of the X & Y axis
			.startY(25) // Starts on 25 without `.anchorAt(H.CENTER)`
			 // because a grid made up of cells & rows & columns
			.spacing(50,50) // spacing between each of cells
			.cols(11) // the only reason why to specify columns
			// is because HDrawablePool has a number of assets that are being drawn
			// so… 121/11 would tell you how many rows the grid is going to have
			// there's no need to specify rows
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.strokeJoin(ROUND)
						.strokeCap(ROUND)
						.strokeWeight(1)
						.stroke(#000000)
						// .anchorAt(H.CENTER)
						// .rotate((int)random(4) * 90);
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	H.drawStage();
}
 

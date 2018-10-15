import hype.*;
import hype.extended.colorist.HColorPool;
import hype.extended.layout.HGridLayout;
import processing.pdf.*;

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
		.add(new HShape("svg1.svg"))
		.add(new HShape("svg2.svg"))
		.add(new HShape("svg3.svg"))
		.add(new HShape("svg4.svg"))
		.add(new HShape("svg5.svg"))
		.add(new HShape("svg6.svg"))

		.layout(
			new HGridLayout()
			.startX(50)
			.startY(50)
			.spacing(50,50)
			.cols(11)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.strokeJoin(ROUND)
						.strokeCap(ROUND)
						.strokeWeight(1) // stroke scaling with size scaling
							// in Illustartor:
									// select all strokes;
									// ⌘H -> hide selection
									// dublicate stroke, make 3 px & oppasity for 20 %
									// for best print result
						.stroke(#000000)
						// .anchorAt(H.CENTER)
						.rotate( (int)random(4) * 90 )
						.size( 50 + ( (int)random(4) * 50 ) ) // 50, 100, 150, 200
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	saveVector();
	noLoop();
}
 
void draw() {
	H.drawStage();
}

void saveVector() {
	PGraphics tmp = null;
	tmp = beginRecord(PDF, "render.pdf");

	if (tmp == null) {
		H.drawStage();
	} else {
		H.stage().paintAll(tmp, false, 1); // PGraphics, uses3D, alpha
	}

	endRecord();
}












 

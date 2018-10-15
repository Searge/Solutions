import hype.*;
import hype.extended.colorist.HColorPool;
import hype.extended.layout.HShapeLayout;

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

	pool = new HDrawablePool(2000);
	pool.autoAddToStage()
		// .add(new HShape("svg1.svg"))
		// .add(new HShape("svg2.svg"))
		// .add(new HShape("svg3.svg"))
		// .add(new HShape("svg4.svg"))
		.add(new HShape("svg5.svg"))
		// .add(new HShape("svg6.svg"))

		.layout(
			new HShapeLayout()
			.target(
				new HImage("shapeMap.png")
			)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.anchorAt(H.CENTER)
						.size( (int)random(10,30) )
						.rotate( (int)random(360) )
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	H.drawStage();
}
 

import hype.*;
import hype.extended.colorist.HColorPool;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HDrawablePool pool;
HColorPool colors;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);

	pool = new HDrawablePool(50);
	pool.autoAddToStage()
		.add(new HShape("mongo1.svg"))
		.add(new HShape("mongo2.svg"))
		.add(new HShape("mongo3.svg"))
		.add(new HShape("mongo4.svg"))
		.add(new HShape("mongo5.svg"))
		.add(new HShape("mongo6.svg"))
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
						.size( (int)random(200,400) )
						.rotate( (int)random(360) )
						.loc( (int)random(myStageW), (int)random(myStageH) )
						.anchorAt(H.CENTER)
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	H.drawStage();
}
 

import hype.*;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HDrawablePool pool;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	pool = new HDrawablePool(100);
	pool.autoAddToStage()
		.add(new HRect(), 20)
		.add(new HRect().rounding(10))
		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.strokeWeight(1)
						.stroke(#FF3300)
						.fill(#111111)
						.size( (int)random(25,125) )
						.rotate( (int)random(360) )
						.loc( (int)random(myStageW), (int)random(myStageH) )
						.anchorAt(H.CENTER)
					;
				}
			}
		)
		.requestAll()
	;

	H.drawStage();
}
 

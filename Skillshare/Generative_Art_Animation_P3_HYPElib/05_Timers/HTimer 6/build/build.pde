import hype.*;
import hype.extended.behavior.HRotate;
import hype.extended.behavior.HTimer;
import hype.extended.colorist.HColorPool;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HCanvas c1;
HColorPool colors;
HDrawablePool pool;
HTimer timer;

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(true);

	c1 = new HCanvas().autoClear(false).fade(5);
	H.add(c1);

	colors = new HColorPool(#FFFFFF, #F7F7F7, 
							#ECECEC, #333333, 
							#0095a8, #00616f, 
							#FF3300, #FF6600);

	pool = new HDrawablePool(100);
	pool.autoParent(c1) // because «HTimer 6» actually has an HCanvas...
		// I say: 'Hey, pool, autoParent into c1'
		.add (
			new HRect()
			.rounding(40)
		)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.noStroke()
						.fill(colors.getColor(), 200)
						.loc( (int)random(myStageW), (int)random(myStageH) )
						.size( 25+((int)random(4)*25) )
						.anchor( 0, -25 ) // ALSO CHANGED
					;

					new HRotate(d, random(-2,2) ); 
					// as the onCreate is creating 100 unique HRectangles,
					// HRotate creates a unique HRotate with each individual assets
				}
			}
		)
	;

	timer = new HTimer()
		.numCycles( pool.numActive() )
		.interval(100)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					pool.request();
				}
			}
		)
	;
}

void draw() {
	H.drawStage();
}


import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.behavior.HRandomTrigger;
import hype.extended.behavior.HRotate;
import hype.extended.colorist.HColorPool;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HRandomTrigger randomTimer;
HCanvas c1;
HDrawablePool pool;
HColorPool colors;
HRect r1;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	randomTimer = new HRandomTrigger( 1f/30 );

	c1 = new HCanvas().autoClear(false).fade(5);
	H.add(c1);

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);

	pool = new HDrawablePool(50);
	pool.autoParent(c1)
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
						.size( 25+((int)random(5)*25) )
						.anchor( 0, -25 )
					;

					new HRotate(d, random(-2,2) );
					new HOscillator().target(d).property(H.SCALE).range(-1, 1).speed(0.5).freq(5).currentStep(pool.currentIndex());
				}
			}
		)
	;

	randomTimer.callback(
		new HCallback() {
			public void run(Object obj) {
				pool.request();
			}
		}
	);
}

void draw() {
	H.drawStage();
}


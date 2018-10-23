import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.colorist.HColorPool;
import hype.extended.layout.HGridLayout;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HDrawablePool pool;

// ***************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	pool = new HDrawablePool(90);
	pool.autoAddToStage()
		.add(
			new HRect(6)
				.rounding(2)
				.anchorAt(H.CENTER)
				.noStroke()
		)

		.colorist( new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095A8, #00616F, #FF3300, #FF6600).fillOnly() )

		.layout(
			new HGridLayout()
				.startLoc(9, myStageH/2)
				.spacing(7, 0)
				.cols(90)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;

					new HOscillator()
						.target(d)
						.property(H.HEIGHT) // ← CHANGE to H.HEIGHT
						// when we attach the artwork across this grid,
						// each one of the HRects is 6×6 px & what
						// I'm oscilating in these files is 
						// I'm stretching only the height of the property
						.range(6, 200) // here i non't need to use relative value
						// because just going to tell it what numbers I want to go to
						.speed(1)
						.freq(3)
						.currentStep( pool.currentIndex()*3 )
					;
				}
			}
		)

		.requestAll()
	;
}

void draw() {
	H.drawStage();
}


import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.colorist.HColorPool;
import hype.extended.layout.HGridLayout;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HDrawablePool pool;

// *******************************************************************************************

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
				// ↑ attaching the artwork in `height / 2`
				// on that center horizon line
				.spacing(7, 0)
				.cols(90)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;

					new HOscillator()
						.target(d)
						.property(H.Y) // oscillate Y axis
						.relativeVal( d.y() ) // use range() off of this base value
						// in the mind where that artwork was initially created
						// in this case, the relative value is d.y(which is `height / 2`)
						.range(-100, 100)
						.speed(1)
						.freq(2)
					;
				}
			}
		)

		.requestAll()
	;
}

void draw() {
	H.drawStage();

	noFill(); strokeWeight(2); stroke(#ECECEC);
	line(0, myStageH/2, myStageW, myStageH/2);
}


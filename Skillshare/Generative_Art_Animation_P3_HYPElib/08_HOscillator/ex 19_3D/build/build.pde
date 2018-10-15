import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.colorist.HColorPool;
import hype.extended.layout.HGridLayout;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HDrawablePool pool;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH,P3D);
}

void setup(){
	H.init(this).background(clrBG).use3D(true).autoClear(true);

	pool = new HDrawablePool(49);
	pool.autoAddToStage()
		.add (
			new HPath()
		)

		.colorist( new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095A8, #00616F, #FF3300, #FF6600).fillOnly() )

		.layout (
			new HGridLayout()
			.startX(81)
			.startY(81)
			.spacing(80,80)
			.cols(7)
		)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					int ranEdges = round(random(5, 10));
					float ranDepth = random(0.25, 0.75);

					HPath path = (HPath) obj;
					path
						.star( ranEdges, ranDepth )
						.size(64)
						.noStroke()
						.anchorAt(H.CENTER)
						.rotation( (int)random(360) )
					;

					new HOscillator()
						.target(path)
						.property(H.ROTATIONY)
						.range(-45, 45)
						.speed(0.5)
						.freq(5)
						.currentStep(pool.currentIndex())
					;

					new HOscillator()
						.target(path)
						.property(H.ROTATIONZ)
						.range(-45, 45)
						.speed(0.3)
						.freq(5)
						.currentStep(pool.currentIndex())
					;

					new HOscillator()
						.target(path)
						.property(H.Z)
						.range(-50, 50)
						.speed(2)
						.freq(1)
						.currentStep(pool.currentIndex()*8)
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


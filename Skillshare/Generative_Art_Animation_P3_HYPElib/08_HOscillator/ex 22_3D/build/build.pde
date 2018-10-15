import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.layout.HGridLayout;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HDrawablePool pool;
int boxSize = 500;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH,P3D);
}

void setup(){
	H.init(this).background(clrBG).use3D(true).autoClear(true);

	pool = new HDrawablePool(50);
	pool.autoAddToStage()
		.add (
			new HBox()
		)

		.layout (
			new HGridLayout()
			.startX(myStageW/2)
			.startY(myStageH/2)
			.spacing(0,0)
			.cols(10)
		)

		.onCreate (
			 new HCallback() {
				public void run(Object obj) {
					int i = pool.currentIndex();
					HBox d = (HBox) obj;
					d
						.depth(boxSize)
						.width(boxSize)
						.height(boxSize)
						.noStroke()
						.z(-500)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONX)
						.range(-360, 360)
						.speed(0.2)
						.freq(1)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONY)
						.range(-360, 360)
						.speed(0.1)
						.freq(2)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(-360, 360)
						.speed(0.05)
						.freq(3)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.SCALE)
						.range(0.2, 1.2)
						.speed(0.3)
						.freq(5)
						.currentStep(i*2)
					;
				}
			}
		)

		.requestAll()
	;
}

void draw() {
	pointLight(255, 51, 0,  0, myStageH/2, -100);        // orange
	pointLight(0, 149, 168,  myStageW, myStageH/2, -100);   // teal
	pointLight(255, 204, 0,  myStageW/2, 0, -50); // yellow

	H.drawStage();
}


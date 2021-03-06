import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.colorist.HColorPool;
import hype.extended.layout.HGridLayout;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HColorPool colors;
HDrawablePool pool;

float ringScale = 600;
int   ringSteps = 5;

// **************************************************************************************

void settings() {
	size(myStageW,myStageH,P3D);
}

void setup(){
	H.init(this).background(clrBG).use3D(true).autoClear(true);

	colors = new HColorPool(#112F41, #068587, 
							#4FB99F, #ECECEC, 
							#F2B134, #ED553B, 
							#ff3300, #242424);

	pool = new HDrawablePool(150);
	pool.autoAddToStage()
		.add (
			new HShape("ring.svg")
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
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.noStroke()
						.fill( colors.getColor(i*250) )
						.size( ringScale ) // 1st ring going to be: 600×600
						.anchorAt(H.CENTER)
						.z(0)
					;

					ringScale = ringScale - ringSteps; // decrease in size

					new HOscillator()
						.target(d)
						.property(H.ROTATIONX)
						.range(-360, 360)
						.speed(0.1)
						.freq(1)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONY)
						.range(-360, 360)
						.speed(0.125)
						.freq(1)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(-360, 360)
						.speed(0.05)
						.freq(1)
						.currentStep(i)
					;

					new HOscillator()
						.target(d)
						.property(H.SCALE)
						.range(0.5, 1.0) // 50% & 100%
						.speed(0.3)
						.freq(5)
						.currentStep(i)
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


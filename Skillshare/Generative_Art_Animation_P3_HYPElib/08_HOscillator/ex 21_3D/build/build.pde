import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.layout.HGridLayout;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HDrawablePool pool;
int boxSize = 150;

// ***************************************************************************************

void settings() {
	size(myStageW,myStageH,P3D);
}

void setup(){
	H.init(this).background(clrBG).use3D(true).autoClear(true);

	pool = new HDrawablePool(100);
	pool.autoAddToStage()
		.add (
			new HBox()
		)
/*
		 ██████╗ ██████╗ ██╗██████╗                                   
		██╔════╝ ██╔══██╗██║██╔══██╗                                  
		██║  ███╗██████╔╝██║██║  ██║                                  
		██║   ██║██╔══██╗██║██║  ██║                                  
		╚██████╔╝██║  ██║██║██████╔╝                                  
		 ╚═════╝ ╚═╝  ╚═╝╚═╝╚═════╝
	   __  ___    ___   __  _  _  ___  ___ 
	 /  \(  _)  (  ,) /  \( \/ )(  _)/ __)
	( () )) _)   ) ,\( () ))  (  ) _)\__ \
	 \__/(_)    (___/ \__/(_/\_)(___)(___/                                 
*/
		.layout (
			new HGridLayout()
			.startX(-125)
			.startY(-125)
			.spacing(100,100)
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
						.z(-500) // big grid dropped way back in space to negative 500  
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONX)
						.range(-180, 180)
						.speed(0.3)
						.freq(1)
						.currentStep(i*2)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONY)
						.range(-180, 180)
						.speed(0.3)
						.freq(1)
						.currentStep(i*2)
					;

					new HOscillator()
						.target(d)
						.property(H.ROTATIONZ)
						.range(-360, 360)
						.speed(0.5)
						.freq(1)
						.currentStep(i*2)
					;
				}
			}
		)

		.requestAll()
	;
}

void draw() {
	/*
			██╗     ██╗ ██████╗ ██╗  ██╗████████╗███████╗
			██║     ██║██╔════╝ ██║  ██║╚══██╔══╝██╔════╝
			██║     ██║██║  ███╗███████║   ██║   ███████╗
			██║     ██║██║   ██║██╔══██║   ██║   ╚════██║
			███████╗██║╚██████╔╝██║  ██║   ██║   ███████║
			╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
	*/
	pointLight(255, 51, 0,  0, myStageH/2, -300);        // orange
	pointLight(0, 149, 168,  myStageW, myStageH/2, -300);   // teal
	pointLight(255, 204, 0,  myStageW/2, myStageH/2, -400); // yellow

	H.drawStage();
}


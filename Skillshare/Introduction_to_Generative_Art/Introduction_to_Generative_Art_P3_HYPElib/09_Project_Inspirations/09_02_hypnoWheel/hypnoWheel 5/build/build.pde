import hype.*;
import hype.extended.behavior.HOscillator;
import hype.extended.behavior.HRotate;
import hype.extended.colorist.HColorPool;
import processing.pdf.*;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HDrawablePool pool;
HColorPool colors;

boolean paused = false;
boolean record = false;

// ************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	colors = new HColorPool()
		.add(#333333)
		.add(#666666, 6)
		.add(#999999, 4)
		.add(#CCCCCC, 2)

		.add(#0095a8)
		.add(#00616f)

		.add(#FF3300)
		.add(#FF6600)
	;

	pool = new HDrawablePool(40);
	pool.autoAddToStage()
	// .add(new HShape("1.svg"))
	.add(new HShape("2.svg"))
	.add(new HShape("3.svg"))
	.add(new HShape("4.svg"))

	.onCreate(
		new HCallback() {
			public void run(Object obj) {

				float ranScale = 1 + ( (int)random(16)*0.3 );
				int ranBaseWeight = 10 + ( (int)random(5)*5 );

				HShape d = (HShape) obj;
				d
					.enableStyle(false)
					.anchorAt(H.CENTER)
					.loc( myStageW/2, myStageH/2 )
					.scale( ranScale )
					.noFill()
					.strokeWeight(ranBaseWeight * (1/ranScale) )
					.strokeJoin(SQUARE)
					.strokeCap(SQUARE)
				;
				d.randomColors(colors.strokeOnly());

				// oscillation

				int i = pool.currentIndex();

				new HOscillator()
					.target(d)
					.property(H.ROTATION)
					.range(-360, 360)
					.speed(0.2)
					.freq(3)
					.currentStep(i)
				;

				new HOscillator()
					.target(d)
					.property(H.SCALE)
					.range(0.25, 1.5)
					.speed(0.5)
					.freq(4)
					.currentStep(i)
				;
			}
		}
	)
	.requestAll();
}

void draw() {
	H.drawStage();
}

// pause, restart, advance 1 / with key presses

// spacebar = pause and restart animation
// +        = redraw() advances 1 iteration in the animation
// r        = render to PDF
// c        = recolor and redraw() advances 1 iteration in the animation

void keyPressed() {
	if (key == ' ') {
		if (paused) {
			loop();
			paused = false;
		} else {
			noLoop();
			paused = true;
		}
	}

	if (key == '+') {
		redraw();
	}

	if (key == 'r') {
		record = true;
		saveVector();
	}

	if (key == 'c') {
		for (HDrawable temp : pool) {
			HShape d = (HShape) temp;
			d.randomColors(colors.strokeOnly());
		}
		redraw();
	}
}

void saveVector() {
	PGraphics tmp = null;
	tmp = beginRecord(PDF, "render_#####.pdf");

	if (tmp == null) {
		H.drawStage();
	} else {
		H.stage().paintAll(tmp, false, 1); // PGraphics, uses3D, alpha
	}

	endRecord();
}










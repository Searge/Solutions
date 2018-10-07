import hype.*;
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

// *************************************************************************************************************

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
	.add(new HShape("1.svg"))
	.add(new HShape("2.svg"))
	.add(new HShape("3.svg"))
	.add(new HShape("4.svg"))

	.onCreate(
		new HCallback() {
			public void run(Object obj) {

				float ranScale = 1 + ( (int)random(16)*0.3 );

				HShape d = (HShape) obj;
				d
					.enableStyle(false)
					.anchorAt(H.CENTER)
					.loc( myStageW/2, myStageH/2 )
					.scale( ranScale )
					.noFill()
					.strokeWeight(10 * (1/ranScale) )
					.strokeJoin(SQUARE)
					.strokeCap(SQUARE)
				;
				d.randomColors(colors.strokeOnly());

				// rotation

				float ranSpeed = random(-6,6);
				if (ranSpeed == 0) ranSpeed = 1;	
				new HRotate(d, ranSpeed );
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










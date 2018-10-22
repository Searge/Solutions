import hype.*;
import hype.extended.behavior.HSwarm;
import hype.extended.behavior.HTimer;
import hype.extended.colorist.HColorField;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HColorField colors;
HSwarm swarm;
HDrawablePool pool;
HTimer timer;

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(false);

	colors = new HColorField(myStageW, myStageH)
		.addPoint(0, myStageH/2, #FF0066, 0.5f)
		.addPoint(myStageW, myStageH/2, #3300FF, 0.5f)
		.fillOnly()
		// .strokeOnly()
		// .fillAndStroke()
	;

	swarm = new HSwarm()
		.addGoal(H.mouse())
		.speed(5)
		.turnEase(0.05f)
		.twitch(20)
	;

	pool = new HDrawablePool(40);
	pool.autoAddToStage()
		.add (
			new HRect()
			.rounding(4)
		)

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.size((int)random(10,20), (int)random(2,6) )
						.strokeWeight(2)
						.stroke(#000000, 100)
						.fill( #000000 ) // set it black for full saturated color
						// U HAVE TO SET A FILL w/color field
						//& u can think of color field is like being a tint
						.loc( myStageW/2, myStageH/2 )
						.anchorAt( H.CENTER )
					;

					colors.applyColor( d );

					swarm.addTarget(d);
				}
			}
		)
	;

	timer = new HTimer()
		.numCycles( pool.numActive() )
		.interval(250)
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
	for(HDrawable d : pool) {
		colors.applyColor(d.fill(#000000));
	}

	H.drawStage();
}


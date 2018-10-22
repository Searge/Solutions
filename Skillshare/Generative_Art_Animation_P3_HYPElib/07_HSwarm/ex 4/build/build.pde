import hype.*;
import hype.extended.behavior.HSwarm;
import hype.extended.behavior.HTimer;
import hype.extended.colorist.HColorPool;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HSwarm swarm;
HDrawablePool pool;
HTimer timer;

// *************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(false);

	swarm = new HSwarm()
		.addGoal(H.mouse()) // Trailing MOUSE Position
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

		.colorist(new HColorPool(	#FFFFFF, #F7F7F7, 
									#ECECEC, #333333, 
									#0095a8, #00616f, 
									#FF3300, #FF6600).fillOnly())


		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.size((int)random(10,20), (int)random(2,6) )
						// randomazing the size of rectangles
						.strokeWeight(2)
						.stroke(#000000, 100)
						.loc( myStageW/2, myStageH/2 )
						.anchorAt( H.CENTER )
					;

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
	H.drawStage();
}


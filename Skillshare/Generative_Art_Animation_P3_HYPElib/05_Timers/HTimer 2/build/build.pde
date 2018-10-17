import hype.*;
import hype.extended.behavior.HTimer;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HTimer timer;
HRect r1;

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	r1 = new HRect(100).rounding(10);
	H.add(r1)
		// .loc( (int)random(myStageW),(int)random(myStageH))
		// All works w/o this piece ↑
		.noStroke()
		.fill(#FF3300)
		.rotation(45)
	;

	timer = new HTimer()
		.interval(250)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					r1.loc( (int)random(myStageW),(int)random(myStageH));
					// reset location randomly
				}
			}
		)
	;
}

void draw() {
	H.drawStage();
}


import hype.*;
import hype.extended.behavior.HTimer;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HTimer timer;
int counter = 1;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	timer = new HTimer()
		.numCycles( 10 )
		.interval(500)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					println("hello, world - " + counter);
					++counter;
				}
			}
		)
	;
}

void draw() {
	H.drawStage();
}


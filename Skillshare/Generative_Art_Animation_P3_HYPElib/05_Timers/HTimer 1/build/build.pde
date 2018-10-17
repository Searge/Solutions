import hype.*;
import hype.extended.behavior.HTimer;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HTimer timer;
int counter = 1;

// ***************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	timer = new HTimer()
		.numCycles( 10 ) // w/o it the timer runs indefinitely
		.interval(500) // INTERVAL in milliseconds
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					// print to the console
					println("Hello, world - " + counter); // plus whatever the value of counter is
					++counter; // then after it has done with that we adding ++
				}
			}
		)
	;
}

void draw() {
	H.drawStage();
}


import hype.*;
import hype.extended.behavior.HTween;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HRect r1;
HTween t1;
HCallback tweenDone1, tweenDone2;
/*
		 Going to use HTween in conjunction with callbacks 
		to move our asset from position A to B & then, when 
		it has arrived @ B, I want to move it back to A again
		& then, start this loop ➿.
*/

PVector pt1 = new PVector(160,320); // left
PVector pt2 = new PVector(480,320); // right

// ***************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	r1 = new HRect(100).rounding(10);
	H.add(r1)
		.anchorAt(H.CENTER)
		.loc(pt1.x, pt1.y)
		.noStroke()
		.fill(#FF3300)
	;

	// GO, START tween from left to right

	t1 = new HTween()
		.target(r1).property(H.LOCATION)
		.start( pt1.x, pt1.y )
		.end( pt2.x, pt2.y )
		.ease(0.05)
		.spring(0.7)
	;

	// ARRIVED at right position, lets move back to the left

	tweenDone1 = new HCallback() {
		public void run(Object obj) {
			t1
				.start( pt2.x, pt2.y )
				.end( pt1.x, pt1.y )
				.register().callback(tweenDone2)
				// ↑ Creating link
			;
		}
	};

	// ARRIVED at left position, lets move back to the right

	tweenDone2 = new HCallback() {
		public void run(Object obj) {
			t1
				.start( pt1.x, pt1.y )
				.end( pt2.x, pt2.y )
				.register().callback(tweenDone1)
			;
		}
	};

	t1.register().callback(tweenDone1);
	// after setup this 2 scenario: tell tween 1 it shold register & call back

}

void draw() {
	H.drawStage();

	noFill(); strokeWeight(2); stroke(#0095a8);
	ellipse(pt1.x, pt1.y, 4, 4);
	ellipse(pt2.x, pt2.y, 4, 4);
}


import hype.*;
import hype.extended.behavior.HTween;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HRect r1, r2, r3;
HTween t1, t2;
HCallback tweenDone1, tweenDone2;
HCallback rotateDone1, rotateDone2;

PVector pt1 = new PVector(160,320); // left
PVector pt2 = new PVector(480,320); // right

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	r1 = new HRect(100).rounding(10);
	H.add(r1).anchorAt(H.CENTER).loc(pt1.x, pt1.y).noStroke().fill(#FF3300);

	r2 = new HRect(50).rounding(5);
	r1.add(r2).anchorAt(H.CENTER).noStroke().fill(#FF6600);

	r3 = new HRect(25);
	r1.add(r3).anchorAt(H.CENTER).noStroke().fill(#00616f);

	// LEFT to RIGHT loop

	t1 = new HTween().target(r1).property(H.LOCATION).start( pt1.x, pt1.y ).end( pt2.x, pt2.y ).ease(0.02).spring(0.7);

	tweenDone1 = new HCallback() {
		public void run(Object obj) {
			t1.start( pt2.x, pt2.y ).end( pt1.x, pt1.y ).register().callback(tweenDone2);
		}
	};

	tweenDone2 = new HCallback() {
		public void run(Object obj) {
			t1.start( pt1.x, pt1.y ).end( pt2.x, pt2.y ).register().callback(tweenDone1);
		}
	};

	// ROTATE, 0 to 180 loop

	t2 = new HTween().target(r1).property(H.ROTATION).start( 0 ).end( 180 ).ease(0.02).spring(0.7);

	rotateDone1 = new HCallback() {
		public void run(Object obj) {
			t2.start( 180 ).end( 0 ).register().callback(rotateDone2);
		}
	};

	rotateDone2 = new HCallback() {
		public void run(Object obj) {
			t2.start( 0 ).end( 180 ).register().callback(rotateDone1);
		}
	};

	t1.register().callback(tweenDone1);
	t2.register().callback(rotateDone1);

}

void draw() {
	H.drawStage();

	noFill(); strokeWeight(2); stroke(#0095a8);
	ellipse(pt1.x, pt1.y, 4, 4);
	ellipse(pt2.x, pt2.y, 4, 4);
}


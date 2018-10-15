import hype.*;
import hype.extended.behavior.HTween;
import hype.extended.colorist.HPixelColorist;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HPixelColorist colors;

HRect r1;
HTween t1;

PVector pt1 = new PVector(160,160); // top, left
PVector pt2 = new PVector(480,160); // top, right
PVector pt3 = new PVector(480,480); // bottom, right
PVector pt4 = new PVector(160,480); // bottom, left

HCallback cb1, cb2, cb3, cb4;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	colors = new HPixelColorist("color.jpg").fillOnly();

	r1 = new HRect(100).rounding(10);
	H.add(r1).anchorAt(H.CENTER).loc(pt1.x, pt1.y).stroke(#000000, 100).fill(#FF3300).rotation(45);

	t1 = new HTween().target(r1).property(H.LOCATION).start( pt1.x, pt1.y ).end( pt2.x, pt2.y ).ease(0.03).spring(0.7);

	cb1 = new HCallback() {
		public void run(Object obj) {
			t1.start( pt1.x, pt1.y ).end( pt2.x, pt2.y ).register().callback(cb2);
		}
	};

	cb2 = new HCallback() {
		public void run(Object obj) {
			t1.start( pt2.x, pt2.y ).end( pt3.x, pt3.y ).register().callback(cb3);
		}
	};

	cb3 = new HCallback() {
		public void run(Object obj) {
			t1.start( pt3.x, pt3.y ).end( pt4.x, pt4.y ).register().callback(cb4);
		}
	};

	cb4 = new HCallback() {
		public void run(Object obj) {
			t1.start( pt4.x, pt4.y ).end( pt1.x, pt1.y ).register().callback(cb1);
		}
	};

	t1.register().callback(cb2);

}

void draw() {
	// update color theft from image
	colors.applyColor(r1);
	
	H.drawStage();

	noFill(); strokeWeight(2); stroke(#0095a8);
	ellipse(pt1.x, pt1.y, 4, 4);
	ellipse(pt2.x, pt2.y, 4, 4);
	ellipse(pt3.x, pt3.y, 4, 4);
	ellipse(pt4.x, pt4.y, 4, 4);
}


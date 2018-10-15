import hype.*;
import hype.extended.behavior.HTween;
import hype.extended.behavior.HOscillator;
import hype.extended.colorist.HPixelColorist;

int myStageW = 640;
int myStageH = 640;

color clrBG = #000000;

HPixelColorist colors;

HBox r1;
HTween t1;

PVector pt1 = new PVector(160,160); // top, left
PVector pt2 = new PVector(480,160); // top, right
PVector pt3 = new PVector(480,480); // bottom, right
PVector pt4 = new PVector(160,480); // bottom, left

HCallback cb1, cb2, cb3, cb4;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH,P3D);
}

void setup(){
	H.init(this).background(clrBG).use3D(true).autoClear(false);

	colors = new HPixelColorist("color.jpg").fillOnly();

	r1 = new HBox();
	H.add(r1)
		.size(100)
		.anchor(50,-50)
		.loc(pt1.x, pt1.y)
		.noStroke()
		.fill(#FFFFFF)
	;

	new HOscillator()
		.target(r1)
		.property(H.ROTATION)
		.range(-180, 180)
		.speed(1)
		.freq(2)
	;

	new HOscillator()
		.target(r1)
		.property(H.Z)
		.range(-400, 100)
		.speed(0.5)
		.freq(15)
	;

	t1 = new HTween().target(r1).property(H.LOCATION).start( pt1.x, pt1.y ).end( pt2.x, pt2.y ).ease(0.01).spring(0.9);

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
	pointLight(255, 51, 0,  0, myStageH/2, -100);     // orange
	pointLight(0, 149, 168,  myStageW, myStageH/2, -50); // teal
	pointLight(255, 255, 255,  myStageW/2, 100, 150);  // white

	colors.applyColor(r1);
	H.drawStage();
}


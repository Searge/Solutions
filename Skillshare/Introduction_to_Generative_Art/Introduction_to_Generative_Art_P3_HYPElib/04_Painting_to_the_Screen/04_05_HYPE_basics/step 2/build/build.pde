import hype.*;
import hype.extended.behavior.HRotate;

int myStageW = 600;
int myStageH = 600;

color clrBG = #ECECEC;

HRect d1,d2,d3,d4,d5;

// **********************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	d1 = new HRect();
	d1.size(50).rotation(45).anchorAt(H.CENTER).loc(100, myStageH/2);
	HRotate r1 = new HRotate().target(d1).speed(-1);
	// DOESN'T NEED `void draw(){}` with HRotate for rotation
	// .target() for whom we want to rotate
	// speend with minus for counterc clockwise
	H.add(d1);

	d2 = new HRect();
	d2.size(50).rotation(45).anchorAt(H.CENTER).loc(200, myStageH/2);
	HRotate r2 = new HRotate().target(d2).speed(1.5);
	H.add(d2);

	d3 = new HRect();
	d3.size(50).rotation(45).anchorAt(H.CENTER).loc(300, myStageH/2);
	HRotate r3 = new HRotate().target(d3).speed(2);
	H.add(d3);

	d4 = new HRect();
	d4.size(50).rotation(45).anchorAt(H.CENTER).loc(400, myStageH/2);
	HRotate r4 = new HRotate().target(d4).speed(2.5);
	H.add(d4);

	d5 = new HRect();
	d5.size(50).rotation(45).anchorAt(H.CENTER).loc(500, myStageH/2);
	HRotate r5 = new HRotate().target(d5).speed(3);
	H.add(d5);
}

void draw() {
	H.drawStage();
	// inside of draw the loop is firing
	// H.drawStage over & over again

	line(0, myStageH/2, myStageW, myStageH/2);

	ellipse(100, myStageH/2, 5, 5);
	ellipse(200, myStageH/2, 5, 5);
	ellipse(300, myStageH/2, 5, 5);
	ellipse(400, myStageH/2, 5, 5);
	ellipse(500, myStageH/2, 5, 5);
}
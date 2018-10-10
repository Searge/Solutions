import hype.*;

int myStageW = 600;
int myStageH = 600;

color clrBG = #ECECEC;

HRect d1,d2,d3,d4,d5;
// d for Drawable

// ****************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	d1 = new HRect();
	d1.size(50).rotation(45).anchorAt(H.CENTER).loc(100, myStageH/2);
	H.add(d1);

	d2 = new HRect();
	d2.size(50).rotation(45).anchorAt(H.CENTER).loc(200, myStageH/2);
	H.add(d2);

	d3 = new HRect();
	d3.size(50).rotation(45).anchorAt(H.CENTER).loc(300, myStageH/2);
	H.add(d3);

	d4 = new HRect();
	d4.size(50).rotation(45).anchorAt(H.CENTER).loc(400, myStageH/2);
	H.add(d4);

	d5 = new HRect();
	d5.size(50).rotation(45).anchorAt(H.CENTER).loc(500, myStageH/2);
	H.add(d5);

	H.drawStage();

	line(0, myStageH/2, myStageW, myStageH/2);

	ellipse(100, myStageH/2, 5, 5);
	ellipse(200, myStageH/2, 5, 5);
	ellipse(300, myStageH/2, 5, 5);
	ellipse(400, myStageH/2, 5, 5);
	ellipse(500, myStageH/2, 5, 5);
}
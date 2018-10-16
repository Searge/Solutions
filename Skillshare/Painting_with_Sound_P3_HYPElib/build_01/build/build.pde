int   myAudioRange = 256;

// *************************************************************************************************************

int   stageMargin  = 100;
int   myStageW     = (myAudioRange*2) + (stageMargin * 2);
int   myStageH     = 300;
color clrBG        = #333333;

// *************************************************************************************************************

void settings() {
	size(myStageW, myStageH);
}

void setup() {
	background(clrBG);
}

void draw() {
	background(clrBG);

	stroke(#999999); noFill();
	line(0, stageMargin, width, stageMargin);
	line(stageMargin, 0, stageMargin, height);
	line(width-stageMargin, 0, width-stageMargin, height);

	stroke(#FF3300); noFill();
	line(0, stageMargin+100, width, stageMargin+100);
}

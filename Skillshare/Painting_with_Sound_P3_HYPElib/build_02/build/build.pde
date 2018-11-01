int   myAudioRange = 256;

// ***************************************************************************************

int   rectSize     = 2;

int   stageMargin  = 100;
int   myStageW     = (myAudioRange * rectSize) + (stageMargin * 2);
int   myStageH     = 300;
color clrBG        = #333333;

float xStart       = stageMargin;
float yStart       = stageMargin;
int   xSpacing     = rectSize;

// ****************************************************************************************

void settings() {
	size(myStageW, myStageH);
}

void setup() {
	background(clrBG);
}

void draw() {
	background(clrBG);

	for (int i = 0; i < myAudioRange; ++i) {
		stroke(0); fill(255);
		rect( xStart + (i*xSpacing), yStart, rectSize, rectSize);
	}

	stroke(#FF3300); noFill();
	line(stageMargin, stageMargin+100, width-stageMargin, stageMargin+100);
}

import hype.*;
import hype.extended.behavior.HTween;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HRect r1;
HTween t1;

int startX = 160;
int endX   = 480;

/*
	Short for in-betweening, the process of generating intermediate frames between two images to give the appearance that the first image evolves smoothly into the second image. Tweening is a key process in all types of animation, including computer animation. Sophisticated animation software enables you to identify specific objects in an image and define how they should move and change during the tweening process.
*/

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	r1 = new HRect(100).rounding(10);
	H.add(r1)
		.anchorAt(H.CENTER)
		.loc(startX, myStageH/2)
		.noStroke()
		.fill(#FF3300)
	;

	// GO, START tween from left to right

	t1 = new HTween()
		.target(r1).property(H.LOCATION)
		// property could be H.ALPHA; H.SCALE; H.ROTATE; constants ...
		.start( startX, myStageH/2 )
		.end( endX, myStageH/2 )
		.ease(0.05)
	;
}

void draw() {
	H.drawStage();

	noFill(); strokeWeight(2); stroke(#0095a8);
	ellipse(startX, myStageH/2, 4, 4);
	ellipse(endX, myStageH/2, 4, 4);
}


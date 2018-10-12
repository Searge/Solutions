import hype.*;
import hype.extended.colorist.HPixelColorist;
// it's using a photo & the color arrangement, & flow,
// & positioning of color on a photograph as a map
// to steal the color & pull into the artwork

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HRect d;
HPixelColorist colors;

// ********************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	H.add(new HImage("kelp.jpg"));
	// adding Image ↑ 

	colors = new HPixelColorist("kelp.jpg").fillOnly();
	// you should go get kelp.jpg for color info
	// another thing that I can also do is specify what I want it to color

	for (int i = 0; i<100; i++){
		d = new HRect();
		d
			.strokeWeight(1)
			.stroke(#000000)
			.size( (int)random(25,75) )
			.rotate( (int)random(360) )
			.loc( (int)random(myStageW), (int)random(myStageH) )
			.anchorAt(H.CENTER)
		;
		colors.applyColor(d);
		// ↑ is going to run through all of the d's that got created here,
		// it's going to go up to line 27, look at the jpg
		// & pull the color into fillOnly
		H.add(d);
	}

	H.drawStage();
}

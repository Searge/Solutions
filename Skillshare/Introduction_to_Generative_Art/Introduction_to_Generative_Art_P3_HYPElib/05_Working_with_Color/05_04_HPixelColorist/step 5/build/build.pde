import hype.*;
import hype.extended.colorist.HPixelColorist;

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

	colors = new HPixelColorist("kelp.jpg");
	// Instead of calling fillAndStroke I'm just going
	// pass it the jpg for coloring

	for (int i = 0; i<100; i++){
		d = new HRect();
		d
			.loc( (int)random(myStageW), (int)random(myStageH) )
			.strokeWeight(3)
			.stroke( colors.getColor( d.x(), d.y() ) )
			.fill( colors.getColor( d.x(), d.y() ), 100 )
			// This is only used if you are looking to apply color to both the Stroke and the Fill, but have an alpha of 100 applied to the Fill assets only. Please notice that when using d.x() and d.y() that .loc() would need to be moved above any d.x() and d.y() calls or it will return 0 for both values every time.
			.size( (int)random(25,125) )
			.rotate( (int)random(360) )
			.anchorAt(H.CENTER)
		;
		// colors.applyColor(d);
		// DELETE THAT ↑
		H.add(d);
	}

	H.drawStage();
}

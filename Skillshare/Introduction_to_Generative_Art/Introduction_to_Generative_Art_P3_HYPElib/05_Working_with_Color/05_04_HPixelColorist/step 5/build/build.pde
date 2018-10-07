import hype.*;
import hype.extended.colorist.HPixelColorist;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HRect d;
HPixelColorist colors;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	colors = new HPixelColorist("kelp.jpg");

	for (int i = 0; i<100; i++){
		d = new HRect();
		d
			.loc( (int)random(myStageW), (int)random(myStageH) )
			.strokeWeight(3)
			.stroke( colors.getColor( d.x(), d.y() ) )
			.fill( colors.getColor( d.x(), d.y() ), 100 )
			.size( (int)random(25,125) )
			.rotate( (int)random(360) )
			.anchorAt(H.CENTER)
		;
		H.add(d);
	}

	H.drawStage();
}

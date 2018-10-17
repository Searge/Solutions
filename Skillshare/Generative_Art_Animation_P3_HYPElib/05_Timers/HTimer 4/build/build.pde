import hype.*;
import hype.extended.behavior.HTimer;
import hype.extended.colorist.HColorPool;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HCanvas c1;
HTimer timer;
HRect r1;
HColorPool colors;

// ***************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(true);

	c1 = new HCanvas().autoClear(false).fade(2);
	H.add(c1);

	colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);

	r1 = new HRect(100).rounding(10);
	c1.add(r1)
		.anchorAt(H.CENTER)
		.noStroke()
		.rotation(45)
		// .loc( (int)random(myStageW),(int)random(myStageH))
		// .fill( colors.getColor() )
		// .size( 25+((int)random(4)*25) )
	;

	timer = new HTimer()
		.interval(1)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					r1
						.loc( (int)random(myStageW),(int)random(myStageH))
						.fill( colors.getColor() )
						.size( 25+((int)random(3)*25) )
					;
				}
			}
		)
	;
}

void draw() {
	H.drawStage();
}


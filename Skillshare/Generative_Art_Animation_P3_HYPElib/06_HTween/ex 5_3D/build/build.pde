import hype.*;
import hype.extended.behavior.HTween;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HRect r1;
HTween t1;
HCallback tweenDone1, tweenDone2;

PVector pt1 = new PVector(320,320,-400); // back
PVector pt2 = new PVector(320,320,100);  // front

// **************************************************************************************

void settings() {
	size(myStageW,myStageH,P3D);
}
/*
  _                               
 (_|   |   |_/                    
   |   |   | _     __,   ,_    _  
   |   |   ||/    /  |  /  |  |/  
    \_/ \_/ |__/  \_/|_/   |_/|__/
    
	██╗   ██╗███████╗██╗███╗   ██╗ ██████╗     ██████╗ ██████╗ 
	██║   ██║██╔════╝██║████╗  ██║██╔════╝     ╚════██╗██╔══██╗
	██║   ██║███████╗██║██╔██╗ ██║██║  ███╗     █████╔╝██║  ██║
	██║   ██║╚════██║██║██║╚██╗██║██║   ██║     ╚═══██╗██║  ██║
	╚██████╔╝███████║██║██║ ╚████║╚██████╔╝    ██████╔╝██████╔╝
	 ╚═════╝ ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═════╝ ╚═════╝ 
                                                          
*/
void setup(){
	H.init(this).background(clrBG).use3D(true);

	r1 = new HRect(100).rounding(10);
	H.add(r1)
		.anchorAt(H.CENTER)
		.loc(pt1.x, pt1.y, pt1.z)
		.noStroke()
		.fill(#FF3300)
	;

	// GO, START tween from back to front

	t1 = new HTween()
		.target(r1).property(H.LOCATION)
		.start( pt1.x, pt1.y, pt1.z )
		.end(   pt2.x, pt2.y, pt2.z )
		.ease(0.05)
		.spring(0.9)
	;

	// ARRIVED at front position, lets move to the back

	tweenDone1 = new HCallback() {
		public void run(Object obj) {
			t1
				.start( pt2.x, pt2.y, pt2.z )
				.end(   pt1.x, pt1.y, pt1.z )
				.ease(0.05).spring(0.0)
				.register().callback(tweenDone2)
			;
		}
	};

	// ARRIVED at back position, lets move to the front

	tweenDone2 = new HCallback() {
		public void run(Object obj) {
			t1
				.start( pt1.x, pt1.y, pt1.z )
				.end(   pt2.x, pt2.y, pt2.z )
				.ease(0.05).spring(0.9)
				.register().callback(tweenDone1)
			;
		}
	};

	t1.register().callback(tweenDone1);

}

void draw() {
	camera(mouseX, myStageH/2, myStageH / tan(PI/3), myStageW/2, myStageH/2, 0, 0, 1, 0);
	H.drawStage();
}


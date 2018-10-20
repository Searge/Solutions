import hype.*;
import hype.extended.behavior.HSwarm;
import hype.extended.behavior.HTimer;
import hype.extended.colorist.HColorPool;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HSwarm swarm;
HDrawablePool pool;
HTimer timer;

/*
                                                        ____   
                                                      ,'  , `. 
                     .---.             __  ,-.     ,-+-,.' _ | 
  .--.--.           /. ./|           ,' ,'/ /|  ,-+-. ;   , || 
 /  /    '       .-'-. ' |  ,--.--.  '  | |' | ,--.'|'   |  || 
|  :  /`./      /___/ \: | /       \ |  |   ,'|   |  ,', |  |, 
|  :  ;_     .-'.. '   ' ..--.  .-. |'  :  /  |   | /  | |--'  
 \  \    `. /___/ \:     ' \__\/: . .|  | '   |   : |  | ,     
  `----.   \.   \  ' .\    ," .--.; |;  : |   |   : |  |/      
 /  /`--'  / \   \   ' \ |/  /  ,.  ||  , ;   |   | |`-'       
'--'.     /   \   \  |--";  :   .'   \---'    |   ;/           
  `--'---'     \   \ |   |  ,     .-./        '---'            
                '---"     `--`---'                          (рій)
                
*/

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	swarm = new HSwarm() // SWARM BEHAVIOR SETUP
		.addGoal(myStageW/2,myStageH/2)
		.speed(4)
		.turnEase(0.025f) // how many degrees of rotation
		// does it make to try to get to the center of the screen
		.twitch(0) // not applying any twitch at all
		// сіпання
	; // NOW ↓ 

	pool = new HDrawablePool(40);
	pool.autoAddToStage()
		.add (
			new HRect()
			.rounding(4)
			.size(18,6)
		)

		.colorist(new HColorPool(	#FFFFFF, #F7F7F7, 
									#ECECEC, #333333, 
									#0095a8, #00616f, 
									#FF3300, #FF6600).fillOnly())

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.noStroke()
						.loc( myStageW/2, 100 )
						.anchorAt( H.CENTER )
					;

					swarm.addTarget(d);
					// → we need to do is REGISTER THE OBJECTS INTO THE SYSTEMX
				}
			}
		)
	;

	timer = new HTimer()
		// Because we want to stagger when these things get presented on screen
		// So, instead of doing a request all, we're using a timer to generate our rects
		.numCycles( pool.numActive() ) // this particular timer is only going to 
		// run 40 times and then shut down.
		.interval(250)
		.callback(
			new HCallback() { 
				public void run(Object obj) {
					pool.request();
				}
			}
		)
	;
}

void draw() {
	H.drawStage();

	noFill(); strokeWeight(2); stroke(#0095a8);
	ellipse(myStageW/2, 100, 4, 4);
	stroke(#FF3300);
	ellipse(myStageW/2, myStageH/2, 4, 4);
}


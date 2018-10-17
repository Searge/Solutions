import hype.*;
import hype.extended.behavior.HTimer;
import hype.extended.colorist.HColorPool;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HDrawablePool pool;
HTimer timer;

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(true);

// 	requestAll
//					      ___           ___           ___           ___     
//					     /\  \         /\  \         /\__\         /\  \    
//					    /::\  \       /::\  \       /::|  |       /::\  \   
//					   /:/\:\  \     /:/\:\  \     /:|:|  |      /:/\:\  \  
//					  /:/  \:\  \   /:/  \:\  \   /:/|:|  |__   /::\~\:\  \ 
//					 /:/__/_\:\__\ /:/__/ \:\__\ /:/ |:| /\__\ /:/\:\ \:\__\
//					 \:\  /\ \/__/ \:\  \ /:/  / \/__|:|/:/  / \:\~\:\ \/__/
//					  \:\ \:\__\    \:\  /:/  /      |:/:/  /   \:\ \:\__\  
//					   \:\/:/  /     \:\/:/  /       |::/  /     \:\ \/__/  
//					    \::/  /       \::/  /        /:/  /       \:\__\    
//					     \/__/         \/__/         \/__/         \/__/    
//					      ___           ___           ___           ___     
//					     /\  \         /\__\         /\  \         |\__\    
//					    /::\  \       /:/ _/_       /::\  \        |:|  |   
//					   /:/\:\  \     /:/ /\__\     /:/\:\  \       |:|  |   
//					  /::\~\:\  \   /:/ /:/ _/_   /::\~\:\  \      |:|__|__ 
//					 /:/\:\ \:\__\ /:/_/:/ /\__\ /:/\:\ \:\__\     /::::\__\
//					 \/__\:\/:/  / \:\/:/ /:/  / \/__\:\/:/  /    /:/~~/~   
//					      \::/  /   \::/_/:/  /       \::/  /    /:/  /     
//					      /:/  /     \:\/:/  /        /:/  /     \/__/      
//					     /:/  /       \::/  /        /:/  /                 
//					     \/__/         \/__/         \/__/       

	pool = new HDrawablePool(100);
	pool.autoAddToStage() // HRectangle assets got added to the Stage
		.add (
			new HRect()
			.rounding(10)
		)

		.colorist(new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600).fillOnly())

		.onCreate (
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.strokeWeight(4)
						.stroke(#000000, 75)
						.loc( (int)random(myStageW), (int)random(myStageH) )
						.rotation(45)
						.size( 50+((int)random(3)*50) )
						.anchorAt( H.CENTER )
					;
				}
			}
		)
	;

	timer = new HTimer()
		.numCycles( pool.numActive() )
		// `numActive` is going to be counting how many things get painted
		// on the screen at a time, until it gets to a hundred
		.interval(100)
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
}


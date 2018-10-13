import hype.*;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HDrawablePool pool;

// **************************************************************************************
// "HDrawablePool + HRect", before we can start working with layout
// it's best for us to cover the "glue" that's going to tie all
// of these things we're assembling together. 

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	// While HDrawablePool has an abundance of features,
	// what's important in the context of this class, is it allows us to do the following :
		// 1. Specify the number of assets being painted to screen
		// 2. Specify which assets are getting painted to screen
		// 3. Like HColorPool, weight the probability of certain assets
			// getting painted more than others
		// 4. Assign layout classes

	pool = new HDrawablePool(100);
	pool.autoAddToStage()
		.add(new HRect(), 20)
		.add(new HRect().rounding(10))
		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.strokeWeight(1)
						.stroke(#FF3300)
						.fill(#111111)
						.size( (int)random(25,125) )
						.rotate( (int)random(360) )
						.loc( (int)random(myStageW), (int)random(myStageH) )
						.anchorAt(H.CENTER)
					;
				}
			}
		)
		.requestAll()
	;

	H.drawStage();
}
 

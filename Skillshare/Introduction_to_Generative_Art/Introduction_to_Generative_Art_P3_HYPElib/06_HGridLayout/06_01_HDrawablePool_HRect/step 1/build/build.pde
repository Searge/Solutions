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
		// 3 fundamental things we're working with
		// when we're saying `autoAddToStage()`
		.add(new HRect(), 20)
		// 1: who're we painting with?
		.add(new HRect().rounding(10))
		.onCreate(
			// 3: Now, when requestAll fires & it's going to fire 100 times
			// it's this ↑ onCreate
			// that's what happens to eaach individual thing
			// getting drawn on screen
			// so think that onCreate is going run a 100 times
			// in the onCreate I want to specify basically this code here
			new HCallback() {
				// this Callback creates an instance of our drawable called `d`
				// `d` is equal drawable obj that you've specified on line 34:
					// `new HRect()`
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
		// 2: requestAll basically says: give me all 100 of them (in HDrawablePool(100))
		// just like `for loop` does
	;

	H.drawStage();
}
 

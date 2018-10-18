import hype.*;
import hype.extended.behavior.HRandomTrigger;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HRandomTrigger randomTimer;
HRect r1;

// **************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	/*
	* Create a new randomTrigger with a 1 in 15 chance
	* of triggering everytime H.drawStage() is called.
	*/

	randomTimer = new HRandomTrigger( 1f/15 );
	// rand = new HRandomTrigger().chance( 1f/15 ); // same as above
	/* 
		Create an instance o this HRandom Triger &
		provide it with a number that represent chance:
			1F / 15 — is 1 in 15 chance that random 
					trigger is going to fire
		e.g. 1 in 15 chance of pulling out a zero.
		& if we pull out a zero, then callback in randomTimer is going
		to return true & it's going to fire

					    /\
					  _(  )_
					 (,`==' )
					   '\/`

		𝗙 -> For random trigger, when you specifying chance,
		you have to pass that number in as a float. So, we're actually
		putting that trailing F behind the number, so that we're passing
		the suffix F is telling the compiler that the number coming in is a float.
	*/
	r1 = new HRect(100).rounding(10);
	H.add(r1)
		.loc( (int)random(myStageW),(int)random(myStageH))
		.noStroke()
		.fill(#FF3300)
		.rotation(45)
	;

	randomTimer.callback(
		new HCallback() {
			public void run(Object obj) {
				r1.loc( (int)random(myStageW),(int)random(myStageH));
			}
		}
	);
}

void draw() {
	H.drawStage();
}
 

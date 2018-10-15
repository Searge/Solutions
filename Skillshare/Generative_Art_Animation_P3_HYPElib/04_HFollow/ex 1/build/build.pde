import hype.*;
import hype.extended.behavior.HFollow;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HFollow mf;
HRect r1;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG).autoClear(true);

	r1 = new HRect(100).rounding(40);
	r1
		.noStroke()
		.fill(#ECECEC)
		.loc(myStageW/2,myStageH/2)
		.anchorAt(H.CENTER)
		.rotation(45)
	;
	H.add(r1);

	// Note: for HFollow we have the following constructors:
	// - new HFollow()
	// - new HFollow(float ease)
	// - new HFollow(float ease, float spring)
	// - new HFollow(float ease, float spring, HFollowable goal)

	mf = new HFollow().target(r1);

	// un/register this behavior from HStage 
	// .unregister()
	// .register()
}

// There are also alternate ways of un/registering HBehaviors:

// H.addBehavior(mf);
// H.removeBehavior(mf);
// H.stage().behaviors().add(mf);
// H.stage().behaviors().remove(mf);

void draw() {
	H.drawStage();
}


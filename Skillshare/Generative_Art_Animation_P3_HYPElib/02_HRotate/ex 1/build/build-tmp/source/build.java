import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import hype.*; 
import hype.extended.behavior.HRotate; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {




int myStageW = 640;
int myStageH = 640;

int clrBG = 0xff202020;

HRect r1;

// ****************************************************************************************

public void settings() {
	size(myStageW,myStageH);
}

public void setup(){
	H.init(this).background(clrBG);

	r1 = new HRect(100).rounding(10);
	H.add(r1)
		.loc(myStageW/2,myStageH/2)
		.noStroke()
		.fill(0xffFF3300)
		// if you don't specify anchor
		// then you're rotating off of 0 X, 0 Y
		// it put it in the UPPER LEFT corner
	;

	HRotate hr1 = new HRotate();
	hr1.target(r1).speed(-0.5f); // 2 degrees at a time
	// speed can be a positive nuber, it's float
	// so you could slowdown animation
	// & make counterclockwise by using negative numbers
}

public void draw() {
	H.drawStage();

	noFill(); strokeWeight(2); stroke(0xff0095a8);
	ellipse(r1.x(), r1.y(), 4, 4);
	// X & Y position of ellipse is what X & Y position of r1
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

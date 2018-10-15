import hype.*;
import hype.extended.behavior.HOscillator;
import processing.video.*;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HOscillator rX,rY,rZ;

int boxSize = 100;
Movie tex;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH,P3D);
}

void setup(){
	H.init(this).background(clrBG).use3D(true);

	tex = new Movie(this, "burst.mp4");
	tex.loop();
	textureMode(NORMAL);

	rX = new HOscillator()
		.range(-360,360)
		.speed(0.1)
		.freq(5)
	;

	rY = new HOscillator()
		.range(-360,360)
		.speed(0.1)
		.freq(5)
	;

	rZ = new HOscillator()
		.range(-360,360)
		.speed(0.1)
		.freq(5)
	;
}

void draw() {
	H.drawStage();

	rX.nextRaw();
	rY.nextRaw();
	rZ.nextRaw();

	pushMatrix();
		translate(width/2, height/2, 0);

		rotateX( radians(rX.curr()) );
		rotateY( radians(rY.curr()) );
		rotateZ( radians(rZ.curr()) );

		buildCube();
	popMatrix();
}

void buildCube() {
	strokeWeight(4); stroke(#000000);
	
	beginShape(QUADS);
		texture(tex);

		// +Z "front" face
		vertex(-boxSize, -boxSize*1.5,  boxSize, 0, 0);
		vertex( boxSize*3, -boxSize,  boxSize, 1, 0);
		vertex( boxSize,  boxSize/2,  boxSize, 1, 1);
		vertex(-boxSize*5,  boxSize*2,  boxSize, 0, 1);

		// // -Z "back" face
		// vertex( boxSize, -boxSize, -boxSize, 0, 0);
		// vertex(-boxSize, -boxSize, -boxSize, 1, 0);
		// vertex(-boxSize,  boxSize, -boxSize, 1, 1);
		// vertex( boxSize,  boxSize, -boxSize, 0, 1);

		// // +Y "bottom" face
		// vertex(-boxSize,  boxSize,  boxSize, 0, 0);
		// vertex( boxSize,  boxSize,  boxSize, 1, 0);
		// vertex( boxSize,  boxSize, -boxSize, 1, 1);
		// vertex(-boxSize,  boxSize, -boxSize, 0, 1);

		// // -Y "top" face
		// vertex(-boxSize, -boxSize, -boxSize, 0, 0);
		// vertex( boxSize, -boxSize, -boxSize, 1, 0);
		// vertex( boxSize, -boxSize,  boxSize, 1, 1);
		// vertex(-boxSize, -boxSize,  boxSize, 0, 1);

		// // +X "right" face
		// vertex( boxSize, -boxSize,  boxSize, 0, 0);
		// vertex( boxSize, -boxSize, -boxSize, 1, 0);
		// vertex( boxSize,  boxSize, -boxSize, 1, 1);
		// vertex( boxSize,  boxSize,  boxSize, 0, 1);

		// // -X "left" face
		// vertex(-boxSize, -boxSize, -boxSize, 0, 0);
		// vertex(-boxSize, -boxSize,  boxSize, 1, 0);
		// vertex(-boxSize,  boxSize,  boxSize, 1, 1);
		// vertex(-boxSize,  boxSize, -boxSize, 0, 1);

	endShape();
}

void movieEvent(Movie m) {
  m.read();
}

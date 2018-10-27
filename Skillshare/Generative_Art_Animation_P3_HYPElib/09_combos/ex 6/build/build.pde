import hype.*;
import hype.extended.behavior.HOscillator;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HOscillator rX,rY,rZ;

int boxSize = 100;
ArrayList texList;
PImage[] pickedTex = new PImage[6]; // NEW ARRAY OF PImages

// **************************************************************************************

void settings() {
	size(myStageW,myStageH,P3D);
}

void setup(){
	H.init(this).background(clrBG).use3D(true);

	PImage t1 = loadImage("tex1.jpg");
	PImage t2 = loadImage("tex2.jpg");
	PImage t3 = loadImage("tex3.jpg");
	PImage t4 = loadImage("tex4.jpg");
	PImage t5 = loadImage("tex5.jpg");

	texList = new ArrayList(); // TEXTURE LIST
	texList.add(t1);
	texList.add(t2);
	texList.add(t3);
	texList.add(t4);
	texList.add(t5);

	// Random PREPICK from `texList` 
	// will run 6 times (coz length of `pickedTex` is 6)
	for (int i = 0; i < pickedTex.length; ++i) {
		pickedTex[i] = (PImage)texList.get((int)random(texList.size()));
	}

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
	
	// +Z "front" face
	beginShape(QUADS);
		texture( pickedTex[0] );
		vertex(-boxSize, -boxSize,  boxSize, 0, 0);
		vertex( boxSize, -boxSize,  boxSize, 1, 0);
		vertex( boxSize,  boxSize,  boxSize, 1, 1);
		vertex(-boxSize,  boxSize,  boxSize, 0, 1);
	endShape();

	// -Z "back" face
	beginShape(QUADS);
		texture( pickedTex[1] );
		vertex( boxSize, -boxSize, -boxSize, 0, 0);
		vertex(-boxSize, -boxSize, -boxSize, 1, 0);
		vertex(-boxSize,  boxSize, -boxSize, 1, 1);
		vertex( boxSize,  boxSize, -boxSize, 0, 1);
	endShape();

	// +Y "bottom" face
	beginShape(QUADS);
		texture( pickedTex[2] );
		vertex(-boxSize,  boxSize,  boxSize, 0, 0);
		vertex( boxSize,  boxSize,  boxSize, 1, 0);
		vertex( boxSize,  boxSize, -boxSize, 1, 1);
		vertex(-boxSize,  boxSize, -boxSize, 0, 1);
	endShape();

	// -Y "top" face
	beginShape(QUADS);
		texture( pickedTex[3] );
		vertex(-boxSize, -boxSize, -boxSize, 0, 0);
		vertex( boxSize, -boxSize, -boxSize, 1, 0);
		vertex( boxSize, -boxSize,  boxSize, 1, 1);
		vertex(-boxSize, -boxSize,  boxSize, 0, 1);
	endShape();

	// +X "right" face
	beginShape(QUADS);
		texture( pickedTex[4] );
		vertex( boxSize, -boxSize,  boxSize, 0, 0);
		vertex( boxSize, -boxSize, -boxSize, 1, 0);
		vertex( boxSize,  boxSize, -boxSize, 1, 1);
		vertex( boxSize,  boxSize,  boxSize, 0, 1);
	endShape();

	// -X "left" face
	beginShape(QUADS);
		texture( pickedTex[5] );
		vertex(-boxSize, -boxSize, -boxSize, 0, 0);
		vertex(-boxSize, -boxSize,  boxSize, 1, 0);
		vertex(-boxSize,  boxSize,  boxSize, 1, 1);
		vertex(-boxSize,  boxSize, -boxSize, 0, 1);
	endShape();
}

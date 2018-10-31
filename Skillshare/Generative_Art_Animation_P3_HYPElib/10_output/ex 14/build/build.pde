import hype.*;
import hype.extended.behavior.HOscillator;

int myStageW = 640;
int myStageH = 640;

color clrBG = #202020;

HOscillator rX,rY,rZ;

ArrayList texList;
PImage[] pickedTex = new PImage[6];

int numCubes = 20;
PVector[] pickedLoc = new PVector[numCubes];

float minScale = 40;
float maxScale = 120;
float[] boxSize = new float[numCubes];

PVector[] pickedRotation = new PVector[numCubes];

// **************************************************************************************

void settings() {
	size(myStageW,myStageH,P3D);
}

void setup(){
	H.init(this).background(clrBG).use3D(true).autoClear(true);

	PImage t1 = loadImage("tex1.jpg");
	PImage t2 = loadImage("tex2.jpg");
	PImage t3 = loadImage("tex3.jpg");
	PImage t4 = loadImage("tex4.jpg");
	PImage t5 = loadImage("tex5.jpg");

	texList = new ArrayList();
	texList.add(t1);
	texList.add(t2);
	texList.add(t3);
	texList.add(t4);
	texList.add(t5);

	for (int i = 0; i < pickedTex.length; ++i) {
		pickedTex[i] = (PImage)texList.get((int)random(texList.size()));
	}
	textureMode(NORMAL);

	for (int i = 0; i < numCubes; ++i) {
		// picked location
		PVector pt = new PVector();
		pt.x = (int)random(-300,300);
		pt.y = (int)random(-300,300);
		pt.z = (int)random(-300,300);
		pickedLoc[i] = pt;

		// picked scale
		boxSize[i] = random(minScale, maxScale);

		// picked rotation 3D / x, y, z
		PVector pr = new PVector( (int)random(360), (int)random(360), (int)random(360) );
		pickedRotation[i] = pr;
	}

	rX = new HOscillator()
		.range(-360,360)
		.speed(0.01)
		.freq(5)
	;

	rY = new HOscillator()
		.range(-360,360)
		.speed(0.01)
		.freq(5)
	;

	rZ = new HOscillator()
		.range(-360,360)
		.speed(0.01)
		.freq(5)
	;
}

void draw() {
	H.drawStage();

	rX.nextRaw();
	rY.nextRaw();
	rZ.nextRaw();

	pushMatrix();
		translate(width/2, height/2, -100);
		rotateX( radians(rX.curr()) );
		rotateY( radians(rY.curr()) );
		rotateZ( radians(rZ.curr()) );

		for (int i = 0; i < numCubes; ++i) {
			pushMatrix();
				translate( pickedLoc[i].x, pickedLoc[i].y, pickedLoc[i].z );

				rotateX( radians(pickedRotation[i].x - frameCount) );
				rotateY( radians(pickedRotation[i].y + frameCount) );
				rotateZ( radians(pickedRotation[i].z) );

				buildCube(i);
			popMatrix();
		}
	popMatrix();
	/*

							███████╗ █████╗ ██╗   ██╗███████╗
							██╔════╝██╔══██╗██║   ██║██╔════╝
							███████╗███████║██║   ██║█████╗  
							╚════██║██╔══██║╚██╗ ██╔╝██╔══╝  
							███████║██║  ██║ ╚████╔╝ ███████╗
							╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝
     _/\/\/\/\/\/\_________________________________________________________________
    _/\/\__________/\/\__/\/\__/\/\/\______/\/\/\__/\/\______/\/\/\______/\/\/\/\_ 
   _/\/\/\/\/\____/\/\/\/\________/\/\____/\/\/\/\/\/\/\__/\/\/\/\/\__/\/\/\/\___  
  _/\/\__________/\/\________/\/\/\/\____/\/\__/\__/\/\__/\/\______________/\/\_   
 _/\/\__________/\/\________/\/\/\/\/\__/\/\______/\/\____/\/\/\/\__/\/\/\/\___    
______________________________________________________________________________                                                                 
	*/
	saveFrame("../frames/#########.tif"); if (frameCount == 900) exit();
			// if reaches a frame count of 900, it's going to exit out of the program
}

void buildCube(int i) {
	strokeWeight(4); stroke(#000000);
	
	// +Z "front" face
	beginShape(QUADS);
		texture( pickedTex[0] );
		vertex(-boxSize[i], -boxSize[i],  boxSize[i], 0, 0);
		vertex( boxSize[i], -boxSize[i],  boxSize[i], 1, 0);
		vertex( boxSize[i],  boxSize[i],  boxSize[i], 1, 1);
		vertex(-boxSize[i],  boxSize[i],  boxSize[i], 0, 1);
	endShape();

	// -Z "back" face
	beginShape(QUADS);
		texture( pickedTex[1] );
		vertex( boxSize[i], -boxSize[i], -boxSize[i], 0, 0);
		vertex(-boxSize[i], -boxSize[i], -boxSize[i], 1, 0);
		vertex(-boxSize[i],  boxSize[i], -boxSize[i], 1, 1);
		vertex( boxSize[i],  boxSize[i], -boxSize[i], 0, 1);
	endShape();

	// +Y "bottom" face
	beginShape(QUADS);
		texture( pickedTex[2] );
		vertex(-boxSize[i],  boxSize[i],  boxSize[i], 0, 0);
		vertex( boxSize[i],  boxSize[i],  boxSize[i], 1, 0);
		vertex( boxSize[i],  boxSize[i], -boxSize[i], 1, 1);
		vertex(-boxSize[i],  boxSize[i], -boxSize[i], 0, 1);
	endShape();

	// -Y "top" face
	beginShape(QUADS);
		texture( pickedTex[3] );
		vertex(-boxSize[i], -boxSize[i], -boxSize[i], 0, 0);
		vertex( boxSize[i], -boxSize[i], -boxSize[i], 1, 0);
		vertex( boxSize[i], -boxSize[i],  boxSize[i], 1, 1);
		vertex(-boxSize[i], -boxSize[i],  boxSize[i], 0, 1);
	endShape();

	// +X "right" face
	beginShape(QUADS);
		texture( pickedTex[4] );
		vertex( boxSize[i], -boxSize[i],  boxSize[i], 0, 0);
		vertex( boxSize[i], -boxSize[i], -boxSize[i], 1, 0);
		vertex( boxSize[i],  boxSize[i], -boxSize[i], 1, 1);
		vertex( boxSize[i],  boxSize[i],  boxSize[i], 0, 1);
	endShape();

	// -X "left" face
	beginShape(QUADS);
		texture( pickedTex[5] );
		vertex(-boxSize[i], -boxSize[i], -boxSize[i], 0, 0);
		vertex(-boxSize[i], -boxSize[i],  boxSize[i], 1, 0);
		vertex(-boxSize[i],  boxSize[i],  boxSize[i], 1, 1);
		vertex(-boxSize[i],  boxSize[i], -boxSize[i], 0, 1);
	endShape();
}

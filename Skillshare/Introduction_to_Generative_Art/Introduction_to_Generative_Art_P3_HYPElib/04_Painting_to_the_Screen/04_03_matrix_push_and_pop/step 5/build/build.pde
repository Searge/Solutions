
void setup(){

	size(600,600);
	rectMode(CENTER);
	// what that meant was is
	// that whatever a rectangle that you make,
	// the ANCHOR POINT is actualy in the CENTER
	// of whatever width and height specified

	pushMatrix();
		translate(100,height/2);
		rotate(radians(45));
		rect(0, 0, 50, 50);
	popMatrix();

	pushMatrix();
		translate(200,height/2);
		rotate(radians(45));
		rect(0, 0, 50, 50);
	popMatrix();

	pushMatrix();
		translate(300,height/2);
		rotate(radians(45));
		rect(0, 0, 50, 50);
	popMatrix();

	pushMatrix();
		translate(400,height/2);
		rotate(radians(45));
		rect(0, 0, 50, 50);
	popMatrix();

	pushMatrix();
		translate(500,height/2);
		rotate(radians(45));
		rect(0, 0, 50, 50);
	popMatrix();

	line(0, height/2, width, height/2);

	ellipse(100, height/2, 5,5);
	ellipse(200, height/2, 5,5);
	ellipse(300, height/2, 5,5);
	ellipse(400, height/2, 5,5);
	ellipse(500, height/2, 5,5);
	
}


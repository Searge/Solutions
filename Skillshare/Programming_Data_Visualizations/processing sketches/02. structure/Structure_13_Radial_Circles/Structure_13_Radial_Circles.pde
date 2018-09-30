
int shapeCount = 10;
int shapeSize = 100;
int circleSize = 200;

void setup() {
  size(800, 800);
}

void draw() {
  background(50);
  noStroke();
  fill(150);
  shapeCount = mouseX/10;
  shapeSize = mouseY/10;
  float shapeAngle = TWO_PI/shapeCount;
  for (int i=0; i<shapeCount; i++) {
    float posx = circleSize * sin(i*shapeAngle) + width/2;
    float posy = circleSize * cos(i*shapeAngle) + height/2;
    ellipse(posx, posy, shapeSize, shapeSize);
  }
}
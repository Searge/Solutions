
int rectHeight = 10;

void setup() {
  size(800, 800);
}

void draw() {
  background(50);
  float rectWidth = mouseX/2;
  int rectCount = mouseY/2;
  float intraRectAngle = TWO_PI/rectCount;
  pushMatrix();
  translate(width/2, height/2);
  for (int i=0; i<rectCount; i++) {
    noStroke();
    fill(150);
    rotate(intraRectAngle);
    rect(0, 0, rectWidth, rectHeight);
  }
  popMatrix();
}
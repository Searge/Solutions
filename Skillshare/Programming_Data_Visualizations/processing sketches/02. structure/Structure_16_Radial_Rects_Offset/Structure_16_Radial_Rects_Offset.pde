
int rectHeight = 10;
int rectWidth = 200;

void setup() {
  size(800, 800);
}

void draw() {
  background(50);
  int rectCount = mouseY/5;
  float intraRectAngle = TWO_PI/rectCount;
  pushMatrix();
  translate(width/2, height/2);
  for (int i=0; i<rectCount; i++) {
    noStroke();
    fill(150);
    rotate(intraRectAngle);
    rect(mouseX/5, 0-rectHeight/2, rectWidth, rectHeight);
  }
  popMatrix();
}
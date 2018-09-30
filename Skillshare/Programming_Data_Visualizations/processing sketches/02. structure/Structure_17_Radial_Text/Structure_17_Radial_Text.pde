
void setup() {
  size(800, 800);
}

void draw() {
  background(50);
  int textCount = mouseY/5;
  float intraTextAngle = TWO_PI/textCount;
  pushMatrix();
  translate(width/2, height/2);
  for (int i=0; i<textCount; i++) {
    noStroke();
    fill(150);
    rotate(intraTextAngle);
    text("Geometry is my friend", mouseX/5, 0);
  }
  popMatrix();
}
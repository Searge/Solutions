

void setup() {
  size(800, 800);
}

void draw() {
  background(50);
  float lineLength = mouseX/2;
  int lineCount = mouseY/2;
  float intraLineAngle = TWO_PI/lineCount;
  for (int i=0; i<lineCount; i++) {
    float posx = lineLength * sin(i*intraLineAngle) + width/2;
    float posy = lineLength * cos(i*intraLineAngle) + height/2;
    noFill();
    stroke(150);
    line(width/2, height/2, posx, posy);
  }
}
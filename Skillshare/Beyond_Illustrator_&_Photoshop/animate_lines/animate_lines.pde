void setup() {
  size(600, 600);
  frameRate(10);
  background(255);
  stroke(0);
}

void draw() {
  //background(255);
  float yPosition = random(height);
  line(0,yPosition, width,yPosition);
}

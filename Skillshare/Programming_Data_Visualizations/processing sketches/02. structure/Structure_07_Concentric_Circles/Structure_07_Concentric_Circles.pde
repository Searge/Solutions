
int originCircleSize = 400;
int circleOffset = 50;
int circleCount = 5;

void setup() {
  size(800, 800);
}

void draw() {
  background(50);
  for (int i=0; i<circleCount; i++) {
    noFill();
    stroke(150);
    rectMode(CENTER);
    strokeWeight(4);
    ellipse(width/2, height/2, originCircleSize+i*circleOffset, originCircleSize+i*circleOffset);
  }
}
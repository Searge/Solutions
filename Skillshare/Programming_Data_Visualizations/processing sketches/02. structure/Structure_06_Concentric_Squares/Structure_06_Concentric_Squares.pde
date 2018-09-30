
int originRectSize = 400;
int rectOffset = 50;
int rectCount = 5;

void setup() {
  size(800, 800);
}

void draw() {
  background(50);
  for (int i=0; i<rectCount; i++) {
    noFill();
    stroke(150);
    rectMode(CENTER);
    strokeWeight(4);
    rect(width/2, height/2, originRectSize+i*rectOffset, originRectSize+i*rectOffset);
  }
}
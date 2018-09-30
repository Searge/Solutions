
int margin = 50;
int pointCount = 20;

void setup() {
  size(800, 800);
  noLoop();
}

void draw() {
  background(50);
  float pointGaps = (width-2*margin)/pointCount;
  beginShape();
  for (int i=0; i<=pointCount; i++) {
    stroke(200);
    noFill();
    strokeWeight(4);
    vertex(i*pointGaps+margin, height/2+random(-100, 100));
  }
  endShape();
}
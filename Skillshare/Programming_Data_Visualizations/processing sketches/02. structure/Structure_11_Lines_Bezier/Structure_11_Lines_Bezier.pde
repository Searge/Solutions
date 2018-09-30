

// Bezier Reference
// https://processing.org/reference/bezierVertex_.html

int margin = 50;

void setup() {
  size(800, 800);
}

void draw() {
  background(50);
  float tension = mouseX;
  stroke(200);
  noFill();
  strokeWeight(4);
  beginShape();
  vertex(margin, margin);
  bezierVertex(margin+tension, margin, width-margin-tension, height-margin, width-margin, height-margin);
  vertex(width-margin, height-margin);
  endShape();
}
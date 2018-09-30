
int margin = 50;
int pointCount = 20;

void setup() {
  size(800, 800);
  noLoop();
}

void draw() {
  background(50);
  float pointGap = (width-2*margin)/pointCount;
  beginShape();
  curveVertex(margin-pointGap, height/2+random(-100, 100));
  for (int i=0; i<=pointCount; i++) {
    stroke(200);
    noFill();
    strokeWeight(4);
    curveVertex(i*pointGap+margin, height/2+random(-100, 100));
  }
  curveVertex((pointCount+1)*pointGap+margin, height/2+random(-100, 100));
  endShape();
}
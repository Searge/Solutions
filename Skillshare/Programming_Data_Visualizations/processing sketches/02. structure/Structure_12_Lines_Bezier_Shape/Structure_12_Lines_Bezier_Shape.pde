
// Bezier Reference
// https://processing.org/reference/bezierVertex_.html

int margin = 50;
int pointCount = 20;
float pointGap;
float[] pointValues = new float[pointCount];

void setup() {
  size(800, 800);
  pointGap = (width-2*margin)/(pointCount-1.0);
  for (int i=0; i<pointValues.length; i++) {
    pointValues[i] = random(-100, 100);
  }
}

void draw() {
  background(50);
  float tension = mouseX/20;
  // Draw point locations
  for (int i=0; i<pointCount; i++) {
    float posX = margin+i*pointGap;
    float posY = height/2+pointValues[i];
    noStroke();
    fill(255, 0, 0);
    ellipse(posX, posY, 10, 10);
  }
  // Draw bezier curve
  beginShape();
  vertex(margin, height/2+pointValues[0]);
  for (int i=1; i<pointValues.length; i++) {
    float posX = i*pointGap+margin;
    float posY = height/2+pointValues[i];
    float c1 = (i-1)*pointGap+margin+tension;
    float c2 = height/2+pointValues[i-1];
    float c3 = posX-tension;
    float c4 = posY;
    stroke(200);
    noFill();
    strokeWeight(4);
    bezierVertex(c1, c2, c3, c4, posX, posY);
  }
  endShape();
}
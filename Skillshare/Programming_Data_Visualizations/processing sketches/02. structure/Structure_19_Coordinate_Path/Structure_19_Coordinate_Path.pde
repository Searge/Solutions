
int margin = 50;
int pointCount = 10;
float[][] pointPairs = new float[pointCount][2];
int markerSize = 10;

void setup() {
  size(800, 800);
  for (int i=0; i<pointCount; i++) {
    pointPairs[i][0] = random(0, 100);
    pointPairs[i][1] = random(0, 100);
  }
}

void draw() {
  background(50);
  
  // Draw Path
  noFill();
  stroke(255, 0, 0);
  strokeWeight(4);
  beginShape();
  curveVertex(map(pointPairs[0][0], 0, 100, margin, width-margin), map(pointPairs[0][1], 0, 100, margin, height-margin));
  for (int i=0; i<pointPairs.length; i++) {
    float posX = map(pointPairs[i][0], 0, 100, margin, width-margin);
    float posY = map(pointPairs[i][1], 0, 100, margin, height-margin);
    curveVertex(posX, posY);
  }
  curveVertex(map(pointPairs[pointPairs.length-1][0], 0, 100, margin, width-margin), map(pointPairs[pointPairs.length-1][1], 0, 100, margin, height-margin));
  endShape();
  
  // Draw Points
  noStroke();
  fill(200);
  for (int i=0; i<pointPairs.length; i++) {
    float posX = map(pointPairs[i][0], 0, 100, margin, width-margin);
    float posY = map(pointPairs[i][1], 0, 100, margin, height-margin);
    ellipse(posX, posY, markerSize, markerSize);
    text(i, posX+10, posY+5);
  }
}
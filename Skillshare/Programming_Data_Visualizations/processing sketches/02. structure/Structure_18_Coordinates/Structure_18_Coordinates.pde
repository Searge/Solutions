
int margin = 50;
int pointCount = 10;
float[][] pointPairs = new float[pointCount][2];

void setup() {
  size(800, 800);
  for (int i=0; i<pointCount; i++) {
    pointPairs[i][0] = random(0, 100);
    pointPairs[i][1] = random(0, 100);
  }
}

void draw() {
  background(50);
  noStroke();
  fill(200);
  for (int i=0; i<pointPairs.length; i++) {
    float posX = map(pointPairs[i][0], 0, 100, margin, width-margin);
    float posY = map(pointPairs[i][1], 0, 100, margin, height-margin);
    ellipse(posX, posY, mouseX/10, mouseX/10);
  }
}
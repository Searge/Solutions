
int ellipseCount = 200;
int labelingThreshold = 45;
float ellipseInfo[][] = new float[ellipseCount][3];

void setup() {
  size(800, 800);
  randomSeed(1);
  for (int i=0; i<ellipseCount; i++) {
    ellipseInfo[i][0] = random(0, width);
    ellipseInfo[i][1] = random(0, height);
    ellipseInfo[i][2] = random(0, 50);
  }
}

void draw() {
  background(50);
  for (int i=0; i<ellipseCount; i++) {
    noStroke();
    fill(200);
    ellipse(ellipseInfo[i][0], ellipseInfo[i][1], ellipseInfo[i][2], ellipseInfo[i][2]);
    if (ellipseInfo[i][2] > mouseX || ellipseInfo[i][2] > labelingThreshold) {
      fill(50);
      textAlign(CENTER);
      text(int(ellipseInfo[i][2]), ellipseInfo[i][0], ellipseInfo[i][1]+3);
    }
  }
}
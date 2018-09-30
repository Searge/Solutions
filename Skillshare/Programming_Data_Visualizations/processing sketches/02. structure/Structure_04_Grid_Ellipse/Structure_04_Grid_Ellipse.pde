
int margin = 50;
int ellipseSize = 100;
int ellipseCount = 5;

void setup() {
  size(800, 800);
}

void draw() {
  background(50);
  for (int i=0; i<ellipseCount; i++) {
    for (int n=0; n<ellipseCount; n++) {
      noStroke();
      fill(150);
      ellipseMode(CORNER);
      ellipse(n*ellipseSize+(n+1)*margin, i*ellipseSize+(i+1)*margin, ellipseSize, ellipseSize);
    }
  }
}
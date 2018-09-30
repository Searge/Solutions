
int rectSize = 0;
int rectCount = 5;
float rectSpacing;

void setup() {
  size(800, 800);
  rectSpacing = width/rectCount;
}

void draw() {
  background(50);
  rectSize = mouseX;
  for (int i=1; i<rectCount; i++) {
    for (int n=1; n<rectCount; n++) {
      noStroke();
      fill(150);
      rectMode(CENTER);
      rect(n*rectSpacing, i*rectSpacing, rectSize, rectSize);
    }
  }
}
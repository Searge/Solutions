
int margin = 50;
int rectSize = 100;
int rectCount = 5;

void setup() {
  size(800, 800);
}

void draw() {
  background(50);
  for (int i=0; i<rectCount; i++) {
    for (int n=0; n<rectCount; n++) {
      noStroke();
      fill(150);
      rect(n*rectSize+(n+1)*margin, i*rectSize+(i+1)*margin, rectSize, rectSize);
    }
  }
}
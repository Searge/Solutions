
int margin = 50;
int ellipseCount = 25;
int ellipseSize = 10;
int ellipseSpacing;

void setup() {
  size(800, 800);
  colorMode(RGB, 100); // Second value is range of color scale (eg, 0–100);
  ellipseSpacing = (width-2*margin)/ellipseCount;
}

void draw() {
  background(10);
  noStroke();
  for (int i=0; i<ellipseCount; i++) {
    for (int n=0; n<ellipseCount; n++) {
      float r = map(n, 0, ellipseCount, 0, 100);
      float g = map(i, 0, ellipseCount, 0, 100);
      float b = map(mouseX, 0, width, 0, 100);;
      fill(color(r, g, b));
      ellipseMode(CORNER);
      ellipse(n*ellipseSpacing+margin, i*ellipseSpacing+margin, ellipseSize, ellipseSize);
    }
  }
}
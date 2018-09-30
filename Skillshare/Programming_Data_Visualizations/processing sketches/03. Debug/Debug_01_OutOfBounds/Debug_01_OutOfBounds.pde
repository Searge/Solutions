
int[] markerSizes = {10, 50, 100, 200, 250, 400, 550, 700};

void setup() {
  size(800, 800);
}

void draw() {
  background(50);
  float opacity = map(mouseX, 0, width, 0, 255);
  fill(200, opacity);
  noStroke();
  for (int i=0; i<=markerSizes.length; i++) {
    // <= instead of < will overshoot the size of the array and lead to an error
    ellipse(width/2, height/2, markerSizes[i], markerSizes[i]);
  }
}
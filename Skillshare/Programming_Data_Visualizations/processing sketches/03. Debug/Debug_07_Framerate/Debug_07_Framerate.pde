
void setup() {
  size(800, 800);
  frameRate(120);
}

void draw() {
  surface.setTitle(int(frameRate) + " fps / " + frameCount + " frames");
  background(50);
  noStroke();
  fill(200);
  for (int i=0; i<frameCount*100; i++) {
    ellipse(random(0,width), random(0, height), 2, 2);
  }
}
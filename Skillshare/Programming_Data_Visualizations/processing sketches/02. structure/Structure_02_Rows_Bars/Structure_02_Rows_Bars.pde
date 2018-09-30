
int margin = 50;
int rectSize = 100;
int rectCount = 5;
int barCount = 20;

void setup() {
  size(800, 800);
  noLoop();
}

void draw() { 
  background(50);
  float barWidth = (width-2*margin)/barCount;
  for (int i=0; i<rectCount; i++) {
    for (int j=0; j<barCount; j++) {
      noStroke();
      fill(150);
      rect(margin+j*barWidth, i*rectSize+(i+1)*margin+rectSize, barWidth, -1*random(rectSize/2, rectSize));
    }
  }
}

int margin = 50;
int elementCount = 21;
float elementSpacing1, elementSpacing2, elementSpacing3;
int elementSize = 10;

void setup() {
  size(800, 800);
  // Calculations made entirely with ints do not have decimal precision
  elementSpacing1 = (width-2*margin)/elementCount; // innacurate
  elementSpacing2 = (width-2.0*margin)/elementCount; // precise
  elementSpacing3 = (width-2*margin)/float(elementCount); // precise
  println(elementSpacing1 + " / " + elementSpacing2 + " / " + elementSpacing3);
}

void draw() {
  background(50); 
  noFill();
  stroke(100);
  rect(margin, margin, width-2*margin, height-2*margin);
  for (int i=0; i<elementCount+1; i++) {
    noStroke();
    fill(200);
    float posX = margin+i*elementSpacing1;
    ellipse(posX, height/2-margin, elementSize, elementSize);
    posX = margin+i*elementSpacing2;
    ellipse(posX, height/2, elementSize, elementSize);
    posX = margin+i*elementSpacing3;
    ellipse(posX, height/2+margin, elementSize, elementSize);
  }
}
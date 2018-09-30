
import processing.pdf.*;

Table table;
String[] month = new String[0];
float[] walk = new float[0];
float[] run = new float[0];
float[] cycle = new float[0];
int lineWeight = 5;
int margin = 50;
float pointGap;
float tension;
boolean record;
color[] palette = {color(23, 225, 0), color(239, 31, 193), color(0, 216, 224)};

void setup() {
  size(800, 800);
  table = loadTable("Activities.csv", "header");
  for (TableRow row : table.rows()) {
    month = append(month, row.getString("Month"));
    walk = append(walk, row.getFloat("Walk"));
    run = append(run, row.getFloat("Run"));
    cycle = append(cycle, row.getFloat("Cycle"));
  }
  pointGap = (width-2*margin)/(month.length-1.0);
}

void draw() {
  if (record) {
    beginRecord(PDF, "frame-####.pdf");
  }
  background(0);
  tension = mouseX/20;
  strokeWeight(lineWeight);
  noFill();
  textAlign(CENTER);
  // Walk Line
  drawBezier(walk, palette[0]);
  fill(palette[0]);
  text("walk", width/2-50, height/2+margin);
  // Run Line
  drawBezier(run, palette[1]);
  fill(palette[1]);
  text("run", width/2, height/2+margin);
  // Cycle Line
  drawBezier(cycle, palette[2]);
  fill(palette[2]);
  text("cycle", width/2+50, height/2+margin);
  if (record) {
    endRecord();
    record = false;
    println("PDF Saved!");
  }
}

void drawBezier(float[] values, color c) {
  beginShape();
  noStroke();
  fill(c, 150);
  textAlign(CENTER);
  text(round(values[0]), margin, height/2-values[0]-10);
  vertex(margin, height/2-values[0]);
  for (int i=1; i<values.length; i++) {
    float posX = i*pointGap+margin;
    float posY = height/2-values[i];
    float c1 = (i-1)*pointGap+margin+tension;
    float c2 = height/2-values[i-1];
    float c3 = posX-tension;
    float c4 = posY;
    text(round(values[i]), posX, posY-10);
    bezierVertex(c1, c2, c3, c4, posX, posY);
  }
  noFill();
  stroke(c);
  endShape();
}

void mousePressed() {
  record = true;
}
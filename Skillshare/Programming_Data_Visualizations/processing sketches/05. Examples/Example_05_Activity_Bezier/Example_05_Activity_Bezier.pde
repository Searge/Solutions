

Table table;
String month[] = new String[0];
float walk[] = new float[0];
float run[] = new float[0];
float cycle[] = new float[0];
float totalDistance[] = new float[0];
int lineWeight = 5;
int margin = 50;
float pointGap;


void setup() {
  size(800, 800);
  table = loadTable("Activities.csv", "header");
  for (TableRow row : table.rows()) {
    month = append(month, row.getString("Month"));
    walk = append(walk, row.getFloat("Walk"));
    run = append(run, row.getFloat("Run"));
    cycle = append(cycle, row.getFloat("Cycle"));
    totalDistance = append(totalDistance, row.getFloat("Walk")+row.getFloat("Run")+row.getFloat("Cycle"));
  }
  pointGap = (width-2*margin)/(month.length-1.0);
}

void draw() {
  background(0);
  float tension = mouseX/20;
  strokeWeight(lineWeight);
  noFill();
  // Walk Line
  stroke(23, 225, 0);
  beginShape();
  vertex(margin, height/2-walk[0]);
  for (int i=1; i<walk.length; i++) {
    float posX = i*pointGap+margin;
    float posY = height/2-walk[i];
    float c1 = (i-1)*pointGap+margin+tension;
    float c2 = height/2-walk[i-1];
    float c3 = posX-tension;
    float c4 = posY;
    bezierVertex(c1, c2, c3, c4, posX, posY);
  }
  endShape();
  // Run Line
  stroke(239, 31, 193);
  beginShape();
  vertex(margin, height/2-run[0]);
  for (int i=1; i<run.length; i++) {
    float posX = i*pointGap+margin;
    float posY = height/2-run[i];
    float c1 = (i-1)*pointGap+margin+tension;
    float c2 = height/2-run[i-1];
    float c3 = posX-tension;
    float c4 = posY;
    bezierVertex(c1, c2, c3, c4, posX, posY);
  }
  endShape();
  // Cycle Line
    stroke(0, 216, 224);
  beginShape();
  vertex(margin, height/2-cycle[0]);
  for (int i=1; i<cycle.length; i++) {
    float posX = i*pointGap+margin;
    float posY = height/2-cycle[i];
    float c1 = (i-1)*pointGap+margin+tension;
    float c2 = height/2-cycle[i-1];
    float c3 = posX-tension;
    float c4 = posY;
    bezierVertex(c1, c2, c3, c4, posX, posY);
  }
  endShape();
}
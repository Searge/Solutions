
int innerRad = 300;
int lineWeight = 10;
int lineSpace = 30;

Table table;
String month[] = new String[0];
float walk[] = new float[0];
float run[] = new float[0];
float cycle[] = new float[0];
float totalDistance[] = new float[0];

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
}

void draw() {
  background(0);
  for (int i=0; i<month.length; i++) {
    strokeWeight(lineWeight);
    noFill();
    // Walk Arc
    float walkLength = map(walk[i], 0, max(totalDistance)+mouseX, 0, TWO_PI);
    stroke(23, 225, 0);
    arc(width/2, height/2, innerRad+i*lineSpace, innerRad+i*lineSpace, 0-HALF_PI, walkLength-HALF_PI);
    // Run Arc
    float runLength = map(run[i], 0, max(totalDistance)+mouseX, 0, TWO_PI);
    stroke(239, 31, 193);
    arc(width/2, height/2, innerRad+i*lineSpace, innerRad+i*lineSpace, walkLength-HALF_PI, walkLength+runLength-HALF_PI);
    // Cycle Arc
    float cycleLength = map(cycle[i], 0, max(totalDistance)+mouseX, 0, TWO_PI);
    stroke(0, 216, 224);
    arc(width/2, height/2, innerRad+i*lineSpace, innerRad+i*lineSpace, walkLength+runLength-HALF_PI, walkLength+runLength+cycleLength-HALF_PI);
    // Draw Labels
    noStroke();
    fill(200);
    textAlign(RIGHT);
    text(month[i], width/2-10, height/2-(innerRad+i*lineSpace)/2+5);
  }
}
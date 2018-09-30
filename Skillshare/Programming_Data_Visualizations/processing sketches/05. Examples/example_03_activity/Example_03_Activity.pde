
Table table;
String month[] = new String[0];
float walk[] = new float[0];
float run[] = new float[0];
float cycle[] = new float[0];

void setup() {
  size(800, 800);
  table = loadTable("Activities.csv", "header");
  for (TableRow row : table.rows()) {
    month = append(month, row.getString("Month"));
    walk = append(walk, row.getFloat("Walk"));
    run = append(run, row.getFloat("Run"));
    cycle = append(cycle, row.getFloat("Cycle"));
  }
}

void draw() {
  background(50);
  int lineCount = walk.length;
  float intraLineAngle = TWO_PI/lineCount;
  for (int i=0; i<lineCount; i++) {
    float lineLength = walk[i]*(mouseX/100);
    float posX = lineLength * sin(i*intraLineAngle+PI) + width/2;
    float posY = lineLength * cos(i*intraLineAngle+PI) + height/2;
    noFill();
    stroke(150);
    line(width/2, height/2, posX, posY);
    noStroke();
    fill(200);
    textAlign(CENTER);
    text(month[i], posX, posY);
  }
}
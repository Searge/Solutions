
Table table;
String month[] = new String[0];
float walk[] = new float[0];
float run[] = new float[0];
float cycle[] = new float[0];

void setup() {
  table = loadTable("Activities.csv", "header");
  for (TableRow row : table.rows()) {
    month = append(month, row.getString("Month"));
    walk = append(walk, row.getFloat("Walk"));
    run = append(run, row.getFloat("Run"));
    cycle = append(cycle, row.getFloat("Cycle"));
    println(month[month.length-1] + ": " + walk[walk.length-1] + ", " + run[run.length-1] + ", "  + cycle[cycle.length-1]);
  }
}
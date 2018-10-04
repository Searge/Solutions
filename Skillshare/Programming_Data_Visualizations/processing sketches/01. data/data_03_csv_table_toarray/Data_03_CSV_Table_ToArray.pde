
// Making GLOBAL VARIABLES
Table table;
String month[];
float walk[];
float run[];
float cycle[];

void setup() {
  table = loadTable("Activities.csv", "header");
  // These ARRAYS of values r'goin' 2B as long,
  // as the # of rows in CSV
  month = new String[table.getRowCount()];
  walk = new float[table.getRowCount()];
  run = new float[table.getRowCount()];
  cycle = new float[table.getRowCount()];
  for (int i=0; i<table.getRowCount(); i++) {
    // then as we loop through it
    // we just save each one
    month[i] = table.getRow(i).getString("Month");
    walk[i] = table.getRow(i).getFloat("Walk");
    run[i] = table.getRow(i).getFloat("Run");
    cycle[i] = table.getRow(i).getFloat("Cycle");
    // that allow later to be able to adress them
    println(month[i] + ": " + walk[i] + ", " + run[i] + ", "  + cycle[i]);
  }
}

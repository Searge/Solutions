
// IntDict Reference
// https://processing.org/reference/IntDict.html

Table table;
IntDict myIndex = new IntDict();

void setup() {
  table = loadTable("Dystopias.csv");
  for (TableRow row : table.rows()) {
    myIndex.add(row.getString(2), 1);
  }
  println(myIndex + "\n");
  // Sort & Save to Array
  myIndex.sortValuesReverse();
  String[] keys = myIndex.keyArray();
  int[] values = myIndex.valueArray();
  for (int i=0; i<keys.length; i++) {
    println(keys[i] + ": " + values[i]);
  }
}
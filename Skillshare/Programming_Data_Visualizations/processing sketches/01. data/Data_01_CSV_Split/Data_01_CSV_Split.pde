
String csv[];
String myData[][];

void setup() {
  csv = loadStrings("Activities.csv");
  //println(csv);
  myData = new String[csv.length][4];
  for(int i=0; i<csv.length; i++) {
    myData[i] = csv[i].split(",");
    println(myData[i]);
  }
}
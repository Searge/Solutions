
// LIBRARIES
import processing.pdf.*;
//mport processing.svg.*;

// GLOBAL VARIABLES
PShape baseMap;
// PShape holds an svg

String csv[];
String myData[][];
PFont f;

// SETUP
void setup() {
  size(1800,900);
  noLoop();
  f = createFont("Avenir-Medium", 12);
  baseMap = loadShape("data/WorldMap.svg");
  csv = loadStrings("data/MeteorStrikes.csv");
  myData = new String[csv.length][6];
  
  // PUTING TABLE TO THE ARRAY 
  for(int i=0; i<csv.length; i++) {
    myData[i] = csv[i].split(",");
  }
}

// DRAW
void draw() {
  beginRecord(PDF, "out/meteorStrikes.pdf");
  
  shape(baseMap, 0,0, width, height);
  noStroke();
  
  for(int i=0; i<myData.length; i++) {
    
    float graphLong = map(float(myData[i][3]), -180, 180, 0, width);
    float graphLat = map(float(myData[i][4]), 90, -90, 0, height);
    float markerSize = 0.05*sqrt(float(myData[i][2]))/PI;
    // Making diameter size more accurate ↑
    textMode(MODEL);
    
    // ELLIPSES
    noStroke();
    fill(255, 0, 0, 50);
    ellipse(graphLong,graphLat, markerSize,markerSize);
    
    // 20 LABELS
    if(i<20) {
      fill(0);
      textFont(f);
      text(myData[i][0], graphLong + markerSize / 1.61 + 5,graphLat);
      noFill();
      stroke(0);
      line(graphLong,graphLat,  graphLong + markerSize / 1.61,graphLat);
    }
    
    //println(graphLong + " + " + graphLat);
  }
  
  endRecord();
  println("PDF Saved");
}

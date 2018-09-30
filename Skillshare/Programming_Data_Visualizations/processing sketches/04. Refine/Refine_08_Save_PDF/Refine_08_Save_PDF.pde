
// Courtesy of Marius Watz

import processing.pdf.*;

boolean record;

void setup(){
 size(800,800); 
}

void draw() {
  // Save process begins when 'record' boolean is made true by keyPressed or mousePressed functions
  if (record) {
    beginRecord(PDF, "frame-####.pdf");
  }
  
  // elements to be saved in PDF
  background(50);
  noStroke();
  fill(200);
  ellipse(width/2, height/2, 200, 200);
  
  // Save process ends and 'record' boolean is set back to FALSE
  if (record) {
    endRecord();
    record = false;
    println("PDF Saved!");
  }
}

// Use this function to save using a keystroke
void keyPressed() {
  if (key == 'p') {
    record = true;
  }
}

// Use this function to save on click
void mousePressed() {
    record = true;
}

import processing.pdf.*;

PFont f;

void setup() {
 size(800, 800); 
 f = createFont("Georgia", 24);
 noLoop();
}

void draw() {
 beginRecord(PDF, "output.pdf"); 
 background(50);
 textFont(f);
 textSize(40);
 fill(200);
 textAlign(CENTER);
 text("This text is outlined", width/2, height/2);
 endRecord();
 println("PDF Saved!");
}
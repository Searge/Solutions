
boolean record;

void setup(){
 size(800,800); 
}

void draw() {
  background(50);
  noStroke();
  fill(200);
  ellipse(width/2, height/2, 200, 200);
  
  // File is saved and 'record' boolean is set back to FALSE
  if (record) {
    saveFrame("####.png"); // change suffix to save as .jpg /.png / .tga /.tif
    record = false;
    println("PNG Saved!");
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
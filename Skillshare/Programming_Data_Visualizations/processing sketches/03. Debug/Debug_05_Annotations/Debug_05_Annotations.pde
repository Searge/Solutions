

// Bezier Reference
// https://processing.org/reference/bezierVertex_.html

int margin = 50;
int cpLabelOffset = 10;
int tensionLabelOffset = 16;
int cpMarker = 10;

void setup() {
  size(800, 800);
}

void draw() {
  background(50);
  float tension = mouseX;
  float c1 = margin+tension;
  float c2 = margin;
  float c3 = width-margin-tension;
  float c4 = height-margin;
  
  // Draw lines from bezier points to control points
  noFill();
  strokeWeight(2);
  stroke(80);
  line(c1, c2, margin, margin);
  line(c3, c4, width-margin, height-margin);
  
  // Draw bezier curve
  stroke(200);
  strokeWeight(4);
  beginShape();
  vertex(margin, margin);
  bezierVertex(c1, c2, c3, c4, width-margin, height-margin);
  vertex(width-margin, height-margin);
  endShape();
  
  // Draw control points
  noStroke();
  fill(255, 0, 0);
  ellipse(c1, c2, cpMarker, cpMarker);
  ellipse(c3, c4, cpMarker, cpMarker);
  
  // Label control point positions
  fill(200);
  textAlign(CENTER);
  text(int(c1) + ", " + int(c2), c1, c2-cpLabelOffset);
  text(int(c3) + ", " + int(c4), c3, c4-cpLabelOffset);
  
  // Label bezier tension amount
  fill(100);
  text("+" + int(tension), (c1+margin)/2, c2+tensionLabelOffset);
  text("+" + int(tension), (c3+width-margin)/2, c4+tensionLabelOffset);
}
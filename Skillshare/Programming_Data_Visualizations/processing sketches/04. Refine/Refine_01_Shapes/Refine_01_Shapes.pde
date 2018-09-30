
void setup() {
  size(800, 800);
}

void draw() {
  background(50);
  rectMode(CENTER);  
  ellipseMode(CENTER);

  // Outlined Shapes
  stroke(200);
  strokeWeight(3);
  noFill();
  rect(100, height/2-100, 100, 100);
  ellipse(300, height/2-100, 100, 100);
  triangle(500, height/2-150, 550, height/2-50, 450, height/2-50);
  arc(700, height/2-100, 100, 100, HALF_PI, TWO_PI);

  // Filled Shapes
  noStroke();
  fill(200);
  rect(100, height/2+100, 100, 100);
  ellipse(300, height/2+100, 100, 100);
  triangle(500, height/2+50, 550, height/2+150, 450, height/2+150);
  arc(700, height/2+100, 100, 100, HALF_PI, TWO_PI);
}
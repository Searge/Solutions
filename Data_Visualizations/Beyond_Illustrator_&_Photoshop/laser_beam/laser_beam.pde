void setup() {
  size(500, 500);
  background(random(256));
  //ellipse(width/2, height/2, 100, 100);
}

void draw() {
  stroke(random(256), random(256), random(256));
  line(width/2,height/2, random(width),random(height));
}

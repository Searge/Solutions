boolean painting = false;

void setup() {
  size(800, 800);
  background(255);
}

void draw() {
  rect(0,0, width, 20);
  stroke(random(256), random(256), random(256));
  if (painting == true) {
    ellipse(mouseX, mouseY, 40, 40);
  }
}

void mouseClicked() {
  painting =! painting;
  println(painting);
}

void keyReleased() {
  if (key == 'b' || key == 'B') {
    background(random(255), random(255), random(255));
  }
  
  if (key == 'f' || key == 'F') {
    fill(random(255), random(255), random(255));
    painting = false;
  }
  
  if (key == 's' || key == 'S') {
    save("image-" + frameCount + ".png");
  }
}


float number = random(10000, 99000);

void setup(){
 size(800, 800); 
}

void draw(){
  background(50);
  noStroke();
  fill(200);
  textAlign(CENTER);
  text("original number: " + number, width/2, height/2-100);
  text("whole number: " + int(number), width/2, height/2-50);
  text("formatted number: " + nfc(int(number)), width/2, height/2);
  text("rounded and formatted number: " + nfc(round(number/100)*100), width/2, height/2+50);
  }
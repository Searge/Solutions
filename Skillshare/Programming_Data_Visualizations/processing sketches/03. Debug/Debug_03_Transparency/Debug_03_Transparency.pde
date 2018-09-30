
int[] markerSizes = {10, 50, 100, 200, 250, 400, 550, 700};
float opacity = 255;

void setup(){
 size(800, 800); 
}

void draw(){
 background(50);
 //opacity = map(mouseX, 0, width, 0, 255); // Uncomment to fix
 fill(200, opacity);
 noStroke();
 for(int i=0; i<markerSizes.length; i++){
   ellipse(width/2, height/2, markerSizes[i], markerSizes[i]);
 }
}
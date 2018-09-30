
int[] markerSizes = {10, 50, 100, 200, 250, 400, 550, 700};

void setup(){
 size(800, 800); 
}

void draw(){
 background(50);
 stroke(200);
 noFill();
 for(int i=0; i<markerSizes.length; i++){
   ellipse(width/2, height/2, markerSizes[i], markerSizes[i]);
 }
}


// LIBRARIES
import processing.pdf.*;

// GLOBAL VARIABLES
PShape baseMap;
// PShape holds an svg

// SETUP
void setup() {
  size(1800,900);
  baseMap = loadShape("data/WorldMap.svg");
}

// DRAW
void draw() {
  shape(baseMap, 0,0, width, height);
}

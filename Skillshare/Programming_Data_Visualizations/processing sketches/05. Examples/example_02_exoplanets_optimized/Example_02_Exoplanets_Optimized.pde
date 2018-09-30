
// Data
Table table;
String hostName[], planetLetter[];
float planetRadius[], planetOrbit[], planetPeriod[], planetMass[];

// Constants
int scalePlanet = 3;
int scaleOrbit = 10;

void setup() {
  size(800, 800);
  colorMode(HSB, 100);
  table = loadTable("planets.csv", "header");
  hostName = new String[table.getRowCount()];
  planetLetter = new String[table.getRowCount()];
  planetRadius = new float[table.getRowCount()];
  planetOrbit = new float[table.getRowCount()];
  planetPeriod = new float[table.getRowCount()];
  planetMass = new float[table.getRowCount()];
  for (int i=0; i<table.getRowCount(); i++) {
    hostName[i] = table.getRow(i).getString("pl_hostname");
    planetLetter[i] = table.getRow(i).getString("pl_letter");
    planetRadius[i] = table.getRow(i).getFloat("pl_radj");
    planetOrbit[i] = table.getRow(i).getFloat("pl_orbsmax");
    planetPeriod[i] = table.getRow(i).getFloat("pl_orbper");
    planetMass[i] = table.getRow(i).getFloat("pl_bmassj");
  }
  println(hostName.length);
}

void draw() {
  background(0);
  for (int i=0; i<hostName.length; i++) {
    noStroke();
    float planetHue = map(planetMass[i], 0, 30, 0, 100);
    fill(planetHue, 100, 100);
    float posX = scaleOrbit*mouseX*planetOrbit[i] * sin(frameCount/planetPeriod[i]) + width/2;
    float posY = scaleOrbit*mouseX*planetOrbit[i] * cos(frameCount/planetPeriod[i]) + height/2;
    ellipse(posX, posY, 2*planetRadius[i]*scalePlanet, 2*planetRadius[i]*scalePlanet);
  }
}
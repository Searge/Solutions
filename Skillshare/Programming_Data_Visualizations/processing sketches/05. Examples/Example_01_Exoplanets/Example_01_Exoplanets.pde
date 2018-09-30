
Table table;
int scalePlanet = 3;
int scaleOrbit = 10;

void setup() {
  size(800, 800);
  colorMode(HSB, 100);
  table = loadTable("planets.csv", "header");
}

void draw() {
  background(0);
  int counter = 0;
  for (TableRow row : table.rows()) {
    String hostName = row.getString("pl_hostname");
    String planetLetter = row.getString("pl_letter");
    float planetRadius = row.getFloat("pl_radj");
    float planetOrbit = row.getFloat("pl_orbsmax");
    float planetPeriod = row.getFloat("pl_orbper");
    float planetMass = row.getFloat("pl_bmassj");
    if (planetRadius>0 && planetOrbit>0) {
      counter++;
      //println(counter + ". " + hostName + "-" + planetLetter + ": \t" + planetRadius + "x Jupiter \t" + planetOrbit + " AU");
      noStroke();
      float planetHue = map(planetMass, 0, 30, 0, 100);
      fill(planetHue, 100, 100);
      float posX = scaleOrbit*frameCount*planetOrbit * sin(counter+frameCount/planetPeriod) + width/2;
      float posY = scaleOrbit*frameCount*planetOrbit * cos(counter+frameCount/planetPeriod) + height/2;
      ellipse(posX, posY, planetRadius*scalePlanet, planetRadius*scalePlanet);
    }
  }
}
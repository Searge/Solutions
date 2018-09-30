
// XML Reference
// https://processing.org/reference/XML.html

void setup() {
  XML xml = loadXML("Sample.gpx");
  String fileTime = xml.getChild("metadata/time").getContent();
  println(fileTime);
  String fileName = xml.getChild("trk/name").getContent();
  println(fileName);
  XML[] track = xml.getChildren("trk/trkseg/trkpt");
  float[] lat = new float[track.length];
  float[] lon = new float[track.length];
  String[] elevation = new String[track.length];
  String[] timestamp = new String[track.length];
  for (int i=0; i<track.length; i++) {
    lat[i] = track[i].getFloat("lat");
    lon[i] = track[i].getFloat("lon");
    elevation[i] = track[i].getChild("ele").getContent();
    timestamp[i] = track[i].getChild("time").getContent();
    println(lat[i] + "\t" + lon[i] + "\t" + elevation[i] + "\t" + timestamp[i]);
  }
}
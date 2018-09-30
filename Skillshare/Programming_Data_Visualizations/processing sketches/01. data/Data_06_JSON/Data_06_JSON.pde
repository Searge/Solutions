
// JSON Reference
// https://processing.org/reference/JSONObject.html

String placeName[] = new String[0];
float placeLat[] = new float[0];
float placeLon[] = new float[0];
String startTime[] = new String[0];
String endTime[] = new String[0];

void setup() {
  JSONArray json = loadJSONArray("Sample.json");
  for (int i = 0; i < json.size(); i++) {
    JSONObject elements = json.getJSONObject(0);
    String fileDate = elements.getString("date");
    println(fileDate);
    int calories = elements.getInt("caloriesIdle");
    println(calories);
    JSONArray segments = elements.getJSONArray("segments");
    for (int j = 0; j < segments.size(); j++) {
      JSONObject segment = segments.getJSONObject(j);
      startTime = append(startTime, segment.getString("startTime"));
      endTime = append(endTime, segment.getString("endTime"));
      JSONObject place = segment.getJSONObject("place");
      placeName = append(placeName, place.getString("name"));
      JSONObject location = place.getJSONObject("location");
      placeLat = append(placeLat, location.getFloat("lat"));
      placeLon = append(placeLon, location.getFloat("lon"));
      println(placeName[j] + " \t" + placeLat[j] + " \t" + placeLon[j] + " \t" + startTime[j] + " \t" + endTime[j]);
    }
  }
}
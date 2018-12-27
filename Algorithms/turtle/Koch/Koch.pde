ArrayList<Segment> segments;

void addAll(Segment[] arr, ArrayList<Segment> list) {
  for (Segment s : arr) {
    list.add(s);
  }
}

void setup() {
  size(600, 600);
  segments = new ArrayList<Segment>();

  PVector a = new PVector(0, 300);
  PVector b = new PVector(600, 300);
  Segment start = new Segment(a, b);
  //segments.add(start);

  Segment[] children = start.generate();
  addAll(children, segments);
  println(children);
}

void draw() {
  background(0);

  stroke(255);
  for (Segment s : segments) {
    s.show();
  }
}

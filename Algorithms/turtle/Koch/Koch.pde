ArrayList<Segment> segments;

void addAll(Segment[] arr, ArrayList<Segment> list) {
  for (Segment s : arr) {
    list.add(s);
  }
}

void setup() {
  size(700, 800);
  segments = new ArrayList<Segment>();

  PVector a = new PVector(50, 200);
  PVector b = new PVector(650, 200);
  PVector c = new PVector(350, 700);
  Segment s1 = new Segment(a, b);
  Segment s2 = new Segment(b, c);
  Segment s3 = new Segment(c, a);
  segments.add(s1);
  segments.add(s2);
  segments.add(s3);

  //Segment[] children = start.generate();
  //addAll(children, segments);
  //println(children);
}

void mousePressed() {
  ArrayList<Segment> nextGeneration = new ArrayList<Segment>();
  for (Segment s : segments) {
    Segment[] children = s.generate();
    addAll(children, nextGeneration);
  }
  segments = nextGeneration;
}

void draw() {
  background(0);

  stroke(255);
  for (Segment s : segments) {
    s.show();
  }
}

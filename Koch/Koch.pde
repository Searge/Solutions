ArrayList<Segment> segments;

void setup() {
	size(600, 600);
	segments = new ArrayList<Segment>();

	PVector a = new PVector(0, 300);
	PVector b = new PVector(600, 300);
	segments.add(new Segment(a, b));
}

void draw() {
	background(0);

	stroke(255);
	for (Segment s : segments) {
		s.show();
	}
}

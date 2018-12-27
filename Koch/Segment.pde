class Segment {
   PVector a;
   PVector b;
   
   Segment(PVector a_, PVector b_) {
     a = a_.copy();
     b = b_.copy();
   }

	Segment[] generate() {
		Segment[] children = new Segment[4];

		return null;
	}

	void show() {
		stroke(255);
		line(a.x, a.y, b.x, b.y);
	}
}

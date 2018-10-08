
// ACTION SCRIPT
var numAssets:int = 25;
// xStart, yStart, xSpacing, ySpacing, columns
var layout:GridLayout = GridLayout(50, 50, 100, 100, 5)

// HYPE / procissing
int numAssets = 25;
HGridLayout layout = new HGridLayout();
layout.startX(50);
layout.startY(50);
layout.spacing(100, 100);
layout.cols(5);


// METHOD CHAINING
int numAssets = 25;
HGridLayout layout = new HGridLayout().startX(50).startY(50).spacing(100, 100).cols(5);


// SYNTETIC SUGAR
int numAssets = 25;
HGridLayout layout = new HGridLayout()
	.startX(50)
	.startY(50)
	.spacing(100, 100)
	.cols(5)
;

void setup(){
	size(640,640,P3D);
	background(#202020);
	smooth();
}
 
void draw(){


	// saveFrame("frames/#########.tif"); if (frameCount == 900) exit();
}

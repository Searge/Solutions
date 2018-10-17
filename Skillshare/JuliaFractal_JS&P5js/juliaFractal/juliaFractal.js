function setup() {
  createCanvas(500, 500);
  background(10, 10, 100);
  noLoop();
}

function draw() {
  for (var i = 0; i < width; i++) {
    for (var j = 0; j < height; j++) {
      if (isInJuliaSet(i, j)) {
        stroke(255);
        point(i, j);
      } else {
        stroke(0);
        point(i, j);
      }
    }
  }
}
function isInJuliaSet(x, y) {
  var maxTimes = 100;
  var sx = map(x, 0, width, -2, 2);
  var sy = map(y, 0, height, -2, 2);
  while (i < maxTimes) {
    var real = sx * sx - sy * sy;
    var imag = 2 * sx * sy;

    sx = real + 0.35;
    sy = imag + 0.2;

    if (sx * sx + sy * sy > 4) 
      return false;
    i++;
  }
  return true;
}

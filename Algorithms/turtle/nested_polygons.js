// On Code.org
// https://studio.code.org/projects/artist/qa04P4SlGEqb1NrEJ3yVjlwtJcQESlya-R5vUBVGkT0
var sides;
var length2;
var angle;
var radius;
var points;
var circ;
var repeat;

function MoreAngles(sides, length2, angle) {
  angle = 360 / sides;
  for (var count = 0; count < sides; count++) {
      turnLeft(angle);
    moveForward(length2);
  }
}

function RandomColor() {
}

sides = 3;
radius = 20;
for (var count2 = 0; count2 < 8; count2++) {
  penColour(colour_random());
  length2 = (2 * radius) * (3.14 / sides);
  angle = (180 - 360 / sides) / 2;
  turnLeft(angle);
  MoreAngles(sides, length2, angle);
  turnRight(angle);
  jumpForward(20);
  sides = sides + 1;
  radius = radius + 20;
}
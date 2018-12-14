import turtle

def drawSquare(cx, cy, turtle, side):
    for i in range(4):
        turtle.forward(side)
        turtle.right(90)
    turtle.forward(5)
    turtle.right(90)
    turtle.up()
    turtle.forward(5)
    turtle.down()
    turtle.left(90)


def drawNestedSquare(cx, cy, turtle, side):
    if side >= 1:
        drawSquare(cx, cy, turtle, side)
        drawNestedSquare(cx, cy, turtle, side-10)


def drawsTheSquares(cx, cy, turtle, side):
    turtle.up()
    turtle.goto(cx, cy)
    turtle.forward(side/2)
    turtle.right(90)
    turtle.forward(side/2)
    turtle.right(90)
    turtle.down()
    drawNestedSquare(cx, cy, turtle, side)


def main():
    import turtle
    artem = turtle.Turtle()
    drawsTheSquares(150, 10, artem, 75)


main()

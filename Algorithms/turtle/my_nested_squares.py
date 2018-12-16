import turtle as t
from random import *

t.width(3)
t.speed('fastest')
screen = t.Screen()


def random_color():
    """ Random colour for turtle
        No special statement needed for border
    """
    red = random()
    green = random()
    blue = random()
    t.color(red, green, blue)


def drawCenteredSquare(center, side):
    position = side / 2
    xPoint = center[0] - position
    yPoint = center[1] + position
    t.up()
    t.goto(xPoint, yPoint)
    t.down()
    random_color()
    # t.begin_fill()
    for i in range(4):
        t.forward(side)
        t.right(90)
    # t.end_fill()


def drawNestedSquares(center, side):
    """
    Drawing nested squares in range from
    10 to choosen value
    """
    for i in range(10, side, 10):
        drawCenteredSquare(center, i)
        # drawNestedSquares(center, side + 10)


drawNestedSquares([0, 0], 200)
screen.exitonclick()

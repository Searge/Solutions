import turtle as t
from math import pi, tan
from random import *

t.width(3)
t.speed('fastest')
screen = t.Screen()


# def polygon():
#     radius = 0
#     for x in range(3, n, 1):
#         radius = 360 / x
#         return radius


def random_color():
    """ Random colour for turtle
        No special statement needed for border
    """
    red = random()
    green = random()
    blue = random()
    t.color(red, green, blue)


def drawPolygon(n, side):
    while n > 3:
        for i in range(n):
            t.forward(side)
            t.right(360 / i)


def drawCenteredSquare(center, n, side):
    position = side / 2
    xPoint = center[0] - position
    yPoint = center[1] + position
    t.up()
    t.goto(xPoint, yPoint)
    t.down()
    random_color()

    drawPolygon(n, side)
    # t.begin_fill()
    # t.end_fill()


def drawNestedSquares(center, n, side):
    """
    Drawing nested squares in range from
    10 to choosen value
    """
    # drawCenteredSquare(center, side)
    for i in range(10, side, 10):
        drawCenteredSquare(center, n, i)
        # drawNestedSquares(center, side + 10)


drawNestedSquares([0, 0], 10, 200)
screen.exitonclick()

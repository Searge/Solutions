import turtle
# import random


def drawCentSq(t, center, side):
    # calculate top left corner
    xPt = center[0] - side / 2
    yPt = center[1] + side / 2
    t.up()
    t.goto(xPt, yPt)
    t.down()
    for i in range(4):
        t.forward(side)
        t.right(90)


def drawNestSqCent(t, center, side):
    if side < 1:
        return
    # else: not necessary as long as the return comes first
    drawCentSq(t, center, side)
    drawNestSqCent(t, center, side - 10)


mad = turtle.Turtle()
wn = mad.getscreen()
drawNestSqCent(mad, [0, 0], 100)

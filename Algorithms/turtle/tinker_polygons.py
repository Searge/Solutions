import random
import turtle


def upRange(start, stop, step):
    while start <= stop:
        yield start
        start += abs(step)


def downRange(start, stop, step):
    while start >= stop:
        yield start
        start -= abs(step)


""" Will write later
"""


def nestedPolygons(center):
    global i, length, sides, position, xP, yP, angle
    i_start = float(3)
    i_end = float(sides)
    i_inc = float(1)
    position = length / 2
    xP = center[0] - position
    yP = center[1] + position
    turtle.penup()
    turtle.goto(xP, yP)
    turtle.pendown()
    for i in (i_start <= i_end) and upRange(i_start, i_end, 1) or downRange(i_start, i_end, 1):
        turtle.color('#%06x' % random.randint(0, 2**24 - 1))
        angle = 360 / i
        for count in range(int(i)):
            turtle.forward(length)
            turtle.right(angle)


def Nested(center):
  for x in range(1, length, 10):
    nestedPolygons(center)


turtle.shape("turtle")
turtle.speed(10)
length = 50
sides = 10
nestedPolygons([0, 0])

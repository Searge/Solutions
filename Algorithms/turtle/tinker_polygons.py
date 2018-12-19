import turtle
import random

def upRange(start, stop, step):
    while start <= stop:
        yield start
        start += abs(step)


def downRange(start, stop, step):
    while start >= stop:
        yield start
        start -= abs(step)


turtle.shape("turtle")
turtle.speed(10)
length = 50
sides = 10
i_start = float(3)
i_end = float(sides)
i_inc = float(1)
for i in (i_start <= i_end) and upRange(i_start, i_end, 1) or downRange(i_start, i_end, 1):
    turtle.color('#%06x' % random.randint(0, 2**24 - 1))
    position = length / 2
    xP = 0 - position
    yP = 0 + position
    turtle.penup()
    turtle.goto(xP, yP)
    turtle.pendown()
    angle = 360 / i
    for count in range(int(i)):
        turtle.forward(length)
        turtle.right(angle)

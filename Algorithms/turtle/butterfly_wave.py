# https://searge_.trinket.io/sites/butterflywave

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


"""Drawing two circles
"""


def two_circles(R):
    global i
    for count in range(2):
        turtle.circle(R)
        turtle.left(180)


turtle.shape("circle")
i_start = float(20)
i_end = float(80)
i_inc = float(10)
for i in (i_start <= i_end) and upRange(i_start, i_end, 10) or downRange(i_start, i_end, 10):
    turtle.color('#%06x' % random.randint(0, 2**24 - 1))
    two_circles(i)

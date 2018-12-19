import turtle


def upRange(start, stop, step):
    while start <= stop:
        yield start
        start += abs(step)


def downRange(start, stop, step):
    while start >= stop:
        yield start
        start -= abs(step)


turtle.shape("turtle")
sides = 8
i_start = int(3)
i_end = int(sides)
i_inc = int(0)
for i in range(i_start, i_end):
    angle = 360 / i
    for count in range(int(i)):
        turtle.forward(40)
        turtle.right(angle)

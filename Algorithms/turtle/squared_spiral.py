import turtle


def sq_spiral():
    for i in range(10, 220, 10):
        for count in range(2):
            turtle.forward(i)
            turtle.left(90)


sq_spiral()

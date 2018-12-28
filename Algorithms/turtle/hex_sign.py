# https://searge_.trinket.io/sites/hex-sign

import turtle


def circle():
    """Drawing circle...
    """
    global loops
    for count2 in range(36):
        turtle.forward(10)
        turtle.left(10)


turtle.shape("turtle")
loops = 6
turtle.color('#9999ff')
for count in range(int(loops)):
    circle()
    turtle.right(360 / loops)

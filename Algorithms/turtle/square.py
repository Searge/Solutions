import turtle
from math import pi, tan

turtle.shape('turtle')


def t_square():
    """ Малюємо квадрат.
    """
    for count in range(4):
        turtle.forward(50)
        turtle.left(90)



def t3n_squares():
    PosX = 0
    PosY = 0
    for x in range(10, 100, 10):
        for count in range(4):
            turtle.forward(x)
            turtle.left(90)
        turtle.penup()
        PosX = PosX - 20/tan(pi/4)
        PosY = PosY - 20/tan(pi/4)
        turtle.goto(PosX,PosY)
        turtle.pendown()


t3n_squares()

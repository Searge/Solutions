import turtle

turtle.shape('turtle')


def t_square():
    """ Малюємо квадрат.
    """
    for count in range(4):
        turtle.forward(50)
        turtle.left(90)


t_square()

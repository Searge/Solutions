import turtle

turtle.shape('turtle')


def t_circle():
    """ Малюємо коло.
    """
    for count in range(36):
        turtle.forward(10)
        turtle.left(10)


t_circle()

import turtle

turtle.shape('turtle')


def star():
    for i in range(1, 360, 10):
        turtle.forward((1 + 5) * ((i / 20) * 3.14))
        turtle.right(144)


star()

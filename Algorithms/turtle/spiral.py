import turtle

turtle.shape('turtle')


def random_color():
    turtle.color(random(), random(), random())


def hexagonal():
    for i in range(1, 100):
        turtle.forward(i)
        turtle.right(60)
    random_color()


def flower():
    for i in range(1, 100):
        turtle.forward(i)
        turtle.right(55)
    random_color()


flower()

import turtle
import numpy as np
import random

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


def strange_spiral():
    for radius in np.arange(0, 55, 0.314):
        theta = (2 * np.pi) * radius
        turtle.forward(radius)
        turtle.right(theta)


strange_spiral()

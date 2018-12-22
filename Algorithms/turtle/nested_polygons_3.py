import turtle
import math
turtle.shape('turtle')
sides = 3
R = 10  # задаем радиус первой окружности


def more_agles(sides, length):
    """ Опеределяем функцию, рисующую многоугольник
    """
    angle = 360 / sides
    while sides > 0:

        turtle.left(angle)
        turtle.forward(length)
        sides -= 1


while sides < 13:
    # считаем размер стороны многоугольника (a=2Rsin (360/2n))
    length = 2 * R * math.sin(math.pi / sides)
    Angle = (180 - 360 / sides) / 2
    turtle.left(Angle)

    more_agles(sides, length)
    turtle.right(Angle)

    turtle.penup()
    turtle.forward(10)  # задаем расстояние м/у окружностями
    turtle.pendown()

    sides += 1
    R += 10  # раз расстояние м/у окружностями 10, увеличиваем радиус на 10

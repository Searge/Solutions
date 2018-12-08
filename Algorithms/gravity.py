import graphics as gr

size_x = 400
size_y = 400

window = gr.GraphWin("Model", size_x, size_y)

# Нужно смоделировать равномерное движение шарика на плоскости
# Начнём с описания физической модели. Для моделирования такого процесса,
# нам достаточно знать 2 физические характеристики шарика:
# это его положение в пространстве и направление скорости.

#  Начальное положение шарика
coords = gr.Point(200, 200)
#  Скорость
velocity = gr.Point(1, -2)


def add(point_1, point_2):
    """ Функция, которая возвращает сумму двух векторов
        X k+1 = X k + V*t
    """
    new_point = gr.Point(point_1.x + point_2.x,
                         point_1.y + point_2.y)

    return new_point


def draw_ball(coords):
    """ Процесс отрисовки шарика также лучше вынести на отдельный
        уровень абстракции и оформить в функцию.
    """
    circle = gr.Circle(coords, 10)
    circle.setFill('red')

    circle.draw(window)

# Сначала мы рассчитываем координаты шарика, а после отрисовываем его
# в полученных координатах. И так по кругу, пока мы не захотим
# прервать этот процесс закрытием окна.


def clear_window():
    rectangle = gr.Rectangle(gr.Point(0, 0),
                             gr.Point(size_x, size_y))
    rectangle.setFill('green')
    rectangle.draw(window)


while True:
    clear_window()

    draw_ball(coords)
    coords = add(coords, velocity)

    gr.time.sleep(0.02)

# window.getMouse()
# window.close()

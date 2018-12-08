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
acceleration = gr.Point(0, 0)


def add(point_1, point_2):
    """ Функция, которая возвращает сумму двух векторов
        X k+1 = X k + V*t
    """
    new_point = gr.Point(point_1.x + point_2.x,
                         point_1.y + point_2.y)

    return new_point


def sub(point_1, point_2):
    new_point = gr.Point(point_1.x - point_2.x,
                         point_1.y - point_2.y)

    return new_point


class window_clear:
    def clear_window():
        """ Ф-ция, которая очищает экран, рисуя зеленный квадрат
            на весь экран.
        """
        rectangle = gr.Rectangle(gr.Point(0, 0),
                                 gr.Point(size_x, size_y))
        rectangle.setFill('green')
        rectangle.draw(window)

        sun = gr.Circle(gr.Point(400, 400), 50)
        sun.setFill('yellow')
        sun.draw(window)


class circle:
    def move(coords):
        """ Процесс отрисовки шарика также лучше вынести на отдельный
            уровень абстракции и оформить в функцию.
        """
        circle = gr.Circle(coords, 10)
        circle.setFill('red')

        circle.draw(window)
    # circle = gr.Circle(gr.Point(size_x, size_y), 10)
    # circle.setFill('red')
    # circle.draw(window)

# Сначала мы рассчитываем координаты шарика, а после отрисовываем его
# в полученных координатах. И так по кругу, пока мы не захотим
# прервать этот процесс закрытием окна.


def check_coords(coords, velocity):
    """ Добавим упругое отражение шарика
        от стенок экрана. Это делается очень простым образом.
        В теле основного цикла добавим функцию, которая будет
        проверять столкновение, и, в случае такого события,
        инвертировать скорость шарика по нужной оси.
    """
    if coords.x < 0 or coords.x > size_x:
        velocity.x = -velocity.x

    if coords.y < 0 or coords.y > size_y:
        velocity.y = -velocity.y


def update_coords(coords, velocity):
    return add(coords, velocity)


def update_velocity(velocity, acceleration):
    """ Давайте ещё немного разнообразим модель,
        добавив в наш 2D мирок силу гравитации.
    """
    return add(velocity, acceleration)


def update_acceleration(ball_coords, center_coords):
    """ движение материальной точки в поле центральных сил
    """
    diff = sub(ball_coords, center_coords)
    distance_2 = (diff.x ** 2 + diff.y ** 2) ** (3 / 2)

    # Данная константа установлена методом научного подгона
    G = 2000
    # Теперь ускорение будет меняться в каждый момент времени
    # в соответствии с законом гравитационного притяжения.
    return gr.Point(-diff.x * G / distance_2, -diff.y * G / distance_2)


while True:
    window_clear.clear_window()

    # draw_ball(coords)
    circle.move(coords)

    acceleration = update_acceleration(coords, gr.Point(400, 400))

    coords = update_coords(coords, velocity)
    velocity = update_velocity(velocity, acceleration)
    check_coords(coords, velocity)

    gr.time.sleep(0.02)

# window.getMouse()
# window.close()

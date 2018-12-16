import turtle as t

t.width(3)
t.speed('fastest')
screen = t.Screen()


def jump():
    t.up()
    t.forward(100)
    t.down()


def snokeFlake():
    for i in range(12):
        t.right(30)
        t.forward(100)
        t.left(180)
        jump()


snokeFlake()


screen.exitonclick()

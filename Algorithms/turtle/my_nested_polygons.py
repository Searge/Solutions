import turtle as t

t.width(3)
t.speed('fastest')
screen = t.Screen()

sides = 7


for i in range(3, sides):
    for j in range(i):
        t.forward(100)
        t.right(360 / sides)


screen.exitonclick()

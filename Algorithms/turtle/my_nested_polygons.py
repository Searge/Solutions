import turtle as t

t.width(3)
t.speed('slowest')
screen = t.Screen()

sides = 7
length = 100
center = [0, 0]

for i in range(3, sides):
    angle = 360 / i

    position = length / 2
    xP = center[0] - position
    yP = center[1] + position


    for j in range(i):
        t.forward(length)
        t.left(angle)

    t.right(angle)
    # t.right(-180)
    t.penup()
    # t.goto(xP, yP)
    t.forward(10)
    t.pendown()

    # length += length % 80

screen.exitonclick()

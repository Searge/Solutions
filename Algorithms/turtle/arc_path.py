import turtle
# import random

turtle.width(25)
colors = ["red", "orange",
          "yellow", "green",
          "blue", "indigo",
          "purple"
          ]
n = 0

turtle.penup()
turtle.goto(-250, 0)
turtle.right(4)
turtle.pendown()

for k in range(5):
    turtle.left(90)
    # turtle.color('#%06x' % random.randint(0, 2**24 - 1))
    turtle.color(colors[n])
    for i in range(18):
        turtle.forward(10)
        turtle.right(10)
    for j in range(18):
        turtle.forward(2)
        turtle.right(10)
    turtle.right(90)
    n += 1  # % len(colors)

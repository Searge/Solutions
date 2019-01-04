import turtle
import random


turtle.shape("turtle")
turtle.speed(10)
turtle.penup()
for location in [150, 75, 0, -75, -150]:
    turtle.color('#%06x' % random.randint(0, 2**24 - 1))
    turtle.goto(location, 0)
    turtle.begin_fill()
    turtle.pendown()
    turtle.circle(10)
    turtle.penup()
    turtle.end_fill()
turtle.goto(-70, -50)
turtle.color('#000000')
turtle.goto(0, -80)

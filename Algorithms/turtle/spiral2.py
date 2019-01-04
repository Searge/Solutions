import turtle as t
import math as m

t.color("blue")
t.down()
for i in range(200):
    t = i / 20 * m.pi
    x = (1 + 5 * t) * m.cos(t)
    y = (1 + 5 * t) * m.sin(t)
    t.goto(x, y)
t.up()
t.done()

import turtle as t

size = 500
half_size = size / 2

t.setup(width=size, height=size)

p = t.Pen()
p.up()
p.goto(- half_size, half_size)
p.down()
p.goto(half_size, - half_size)

t.Screen().exitonclick()

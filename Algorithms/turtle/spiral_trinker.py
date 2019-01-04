import math
import turtle


i = 0
while i <= 200:
  t = (i / 20) * math.pi
  x = (1 + 5 * t) * math.cos(t / 180.0 * math.pi)
  y = (1 + 5 * t) * math.sin(t / 180.0 * math.pi)
  turtle.goto(x,y)
  i = i + 1

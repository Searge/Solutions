import turtle
import random

colors = ["dark slate blue",
          "royal blue",
          "light sky blue",
          "medium turquoise",
          "khaki",
          "orange",
          "firebrick"]
# Make a list of colors to picvk from

turtle.width(5)  # What does this line do?

length = 5

for count in range(100):
    color = random.choice(colors)  # Choose a random color
    turtle.forward(length)
    turtle.right(135)
    turtle.color(color)  # Why is color spelt like this?
    length = length + 5

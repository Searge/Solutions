import tkinter as tk
import random

size = 500
one_fourth = size / 4
rect_size = size - one_fourth

root = tk.Tk()
canvas = tk.Canvas(root, width=size, height=size)
canvas.pack()

colors = ('#068587', '#46B29D', '#4FB99F',
          '#F0CA4D', '#E37B40', '#DE5B49')


def random_rectangle(width, height):
    x1 = random.randrange(width)
    y1 = random.randrange(height)
    x2 = x1 + random.randrange(width)
    y2 = y1 + random.randrange(height)
    canvas.create_rectangle(x1, y1,
                            x2, y2,
                            fill=random.choice(colors),
                            outline='')
    # canvas.mainloop() — створює тільки один чотирикутник


for i in range(int(one_fourth)):
    random_rectangle(rect_size, rect_size)

canvas.mainloop()

import tkinter as tk
import random

size = 500

root = tk.Tk()
canvas = tk.Canvas(root, width=size, height=size)
canvas.pack()


def random_rectangle(width, height):
    x1 = random.randrange(width)
    y1 = random.randrange(height)
    x2 = x1 + random.randrange(width)
    y2 = y1 + random.randrange(height)
    canvas.create_rectangle(x1, y1,
                            x2, y2)
    # canvas.mainloop() — створює тільки один чотирикутник


for i in range(0, 100):
    random_rectangle(400, 400)

canvas.mainloop()

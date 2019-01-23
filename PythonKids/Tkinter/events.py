import tkinter as tk
import random

size = 600

half_size = size / 2                # 300
one_fourth = size / 4               # 200
three_fourth = size - one_fourth    # 400
one_sixtieth = size / 60            # 10
one_tenth = size / 10               # 60

colors = ('#068587', '#46B29D', '#4FB99F',
          '#F0CA4D', '#E37B40', '#DE5B49')

root = tk.Tk()
canvas = tk.Canvas(root, width=size, height=size)
canvas.pack()

triangle = canvas.create_polygon(one_sixtieth, one_sixtieth,
                                 one_sixtieth, one_tenth,
                                 one_tenth - 10, 35)


def move_triangle(event):
    if event.keysym == 'Up':
        canvas.move(triangle, 0, -3)
    elif event.keysym == 'Down':
        canvas.move(triangle, 0, 3)
    elif event.keysym == 'Left':
        canvas.move(triangle, -3, 0)
    else:
        canvas.move(triangle, 3, 0)
    for i in colors:
        canvas.itemconfig(triangle,
                          fill=random.choice(colors))


canvas.bind_all('<KeyPress-Up>', move_triangle)
canvas.bind_all('<KeyPress-Down>', move_triangle)
canvas.bind_all('<KeyPress-Left>', move_triangle)
canvas.bind_all('<KeyPress-Right>', move_triangle)

canvas.mainloop()

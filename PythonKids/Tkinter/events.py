import tkinter as tk

size = 600

half_size = size / 2                # 300
one_fourth = size / 4               # 200
three_fourth = size - one_fourth    # 400
one_sixtieth = size / 60            # 10
one_tenth = size / 10               # 60

root = tk.Tk()
canvas = tk.Canvas(root, width=size, height=size)
canvas.pack()

canvas.create_polygon(one_sixtieth, one_sixtieth,
                      one_sixtieth, one_tenth,
                      one_tenth - 10, 35)


def move_triangle(event):
    canvas.move(1, 5, 0)


canvas.bind_all('<KeyPress-Return>', move_triangle)

canvas.mainloop()

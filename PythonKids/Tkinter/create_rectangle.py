import tkinter as tk

size = 500
one_fiftieth = size / 50  # 10
one_tenth = size / 10     # 50

whl_sqr_coord = one_fiftieth + one_tenth
plus_sqr_size = whl_sqr_coord + one_fiftieth * 4

root = tk.Tk()
canvas = tk.Canvas(root, width=size, height=size)
canvas.pack()

canvas.create_rectangle(one_fiftieth, one_fiftieth,
                        one_tenth, one_tenth)
# відстанні задаються від лівої та верхньої сторони полотна
# (x1, y1, x2, y2)
# one_fiftieth то верхній лівий кут
# one_tenth то нижній правий

canvas.create_rectangle(60, one_fiftieth,
                        100, one_tenth)

canvas.create_rectangle(one_fiftieth, 60,
                        one_tenth, 100)

canvas.create_rectangle(60, whl_sqr_coord,
                        100, plus_sqr_size)


canvas.mainloop()

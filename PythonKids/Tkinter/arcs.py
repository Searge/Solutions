import tkinter as tk

size = 600

half_size = size / 2                # 300
one_fourth = size / 4               # 200
three_fourth = size - one_fourth    # 400
one_sixtieth = size / 60            # 10

root = tk.Tk()
canvas = tk.Canvas(root, width=size, height=size)
canvas.pack()

canvas.create_arc(one_sixtieth, one_sixtieth,
                  half_size, half_size,
                  extent=270, style='arc')

canvas.create_arc(half_size + 10, half_size + 10,
                  size - 10, size - 10,
                  extent=270, style='arc')

canvas.create_arc(one_sixtieth, one_sixtieth,
                  half_size, half_size,
                  extent=270, style='arc')


canvas.mainloop()

import tkinter as tk

size = 600

half_size = size / 2                # 300
one_fourth = size / 4               # 200
three_fourth = size - one_fourth    # 400
one_sixtieth = size / 60            # 10

root = tk.Tk()
canvas = tk.Canvas(root, width=size, height=size)
canvas.pack()

canvas.create_text(half_size, half_size, text='Random text')

canvas.mainloop()

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

canvas.create_text(half_size, one_fourth, text='Red text',
                   fill='red')

canvas.create_text(half_size, three_fourth, text='Fira Code Bold, 34',
                   font=('Fira Code Bold', 34))

canvas.mainloop()

import tkinter as tk

size = 500
one_fiftieth = size / 50
one_tenth = size / 10

root = tk.Tk()
canvas = tk.Canvas(root, width=size, height=size)
canvas.pack()

canvas.create_rectangle(one_fiftieth, one_fiftieth,
                        one_tenth, one_tenth)

canvas.mainloop()

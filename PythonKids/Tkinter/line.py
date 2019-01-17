import tkinter as tk

size = 500

root = tk.Tk()
canvas = tk.Canvas(root, width=size, height=size)
canvas.pack()

canvas.create_line(0, 0, size, size)

canvas.mainloop()

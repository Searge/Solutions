import tkinter as tk

size = 600

half_size = size / 2                # 300
one_fourth = size / 4               # 200
three_fourth = size - one_fourth    # 400
one_sixtieth = size / 60            # 10

root = tk.Tk()
canvas = tk.Canvas(root, width=size, height=size)
canvas.pack()

# ТРИКУТНИК
canvas.create_polygon(one_sixtieth, one_sixtieth,
                      100, one_sixtieth,
                      100, 110,
                      fill="", outline="black")

canvas.create_polygon(200, one_sixtieth,
                      240, 30,
                      120, 100,
                      140, 120,
                      fill="", outline="black")


root.mainloop()

import tkinter as tk
import time

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

for i in range(int(one_tenth)):
    canvas.move(1, 5, 0)
    #         id1, 5px → (-5 ←), 0px ↑/↓
    root.update()
    #   оновлюємо екран
    time.sleep(0.05)

canvas.mainloop()

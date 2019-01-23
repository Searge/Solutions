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

cat = tk.PhotoImage(file='cat_face.png')
canvas.create_image(0, 0, anchor='nw', image=cat)

root.mainloop()

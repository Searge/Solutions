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

cat_face = tk.PhotoImage(file='cat_face.png')
cat = canvas.create_image(half_size, half_size,
                          anchor='s', image=cat_face)


def move_triangle(event):
    if event.keysym == 'Up':
        canvas.move(cat, 0, -3)
    elif event.keysym == 'Down':
        canvas.move(cat, 0, 3)
    elif event.keysym == 'Left':
        canvas.move(cat, -3, 0)
    else:
        canvas.move(cat, 3, 0)


canvas.bind_all('<KeyPress-Up>', move_triangle)
canvas.bind_all('<KeyPress-Down>', move_triangle)
canvas.bind_all('<KeyPress-Left>', move_triangle)
canvas.bind_all('<KeyPress-Right>', move_triangle)


root.mainloop()

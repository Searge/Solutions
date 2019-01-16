import tkinter as tk


def здоров():
    print('Здоровенькі були')


root = tk.Tk()
btn = tk.Button(root, text='Click me!', command=здоров)
btn.pack()
btn.mainloop()

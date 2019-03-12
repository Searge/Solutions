import graphics as gr

window = gr.GraphWin('Rectangles', 300, 300)


def fractal_rectangle(A, B, C, D, deep=10):
    if deep < 1:
        return
    for M, N in (A, B), (B, C), (C, D), (D, A):
        gr.Line(gr.Point(*M), gr.Point(*N)).draw(window)


my_rectangle = gr.Rectangle(gr.Point(2, 4), gr.Point(4, 8))
my_rectangle.draw(window)

line1 = gr.Line(gr.Point(2, 4), gr.Point(4, 8))

import graphics as gr

window = gr.GraphWin('Rectangles', 300, 300)


def fractal_rectangle(A, B, C, D, deep=10):
    if deep < 1:
        return
    gr.Line(gr.Point(*A), gr.Point(*B)).draw(window)
    gr.Line(gr.Point(*B), gr.Point(*C)).draw(window)
    gr.Line(gr.Point(*C), gr.Point(*D)).draw(window)
    gr.Line(gr.Point(*D), gr.Point(*A)).draw(window)


my_rectangle = gr.Rectangle(gr.Point(2, 4), gr.Point(4, 8))
my_rectangle.draw(window)

line1 = gr.Line(gr.Point(2, 4), gr.Point(4, 8))

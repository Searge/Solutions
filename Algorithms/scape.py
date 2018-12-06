import graphics as gr

# Инициализация окна с названием и размером 400х400 пикселей
window = gr.GraphWin("Lanscape", 400, 400)
window.setBackground("yellow")

Sky = gr.Rectangle(gr.Point(0, 0), gr.Point(400, 200))
Sky.setFill('blue')

Home = gr.Rectangle(gr.Point(133, 133), gr.Point(266, 266))
Home.setFill('white')

Home2 = gr.Rectangle(gr.Point(138, 138), gr.Point(261, 261))
Home2.setFill('blue')

Home3 = gr.Rectangle(gr.Point(155, 155), gr.Point(244, 244))
Home3.setFill('white')

Window1 = gr.Circle(gr.Point(200, 200), 33)
Window1.setFill('blue')

Window2 = gr.Circle(gr.Point(200, 200), 29)
Window2.setFill('white')

Window3 = gr.Circle(gr.Point(200, 200), 21)
Window3.setFill('blue')

Sky.draw(window)
Home.draw(window)
Home2.draw(window)
Home3.draw(window)
Window1.draw(window)
Window2.draw(window)
Window3.draw(window)


window.getMouse()

window.close()

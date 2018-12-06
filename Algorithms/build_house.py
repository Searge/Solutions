import graphics as gr
# Конспект урока http://judge.mipt.ru/mipt_cs_on_python3/labs/lab4.html


def build_house(window, upper_left_corner, width):
    """Функция, которая рисует дом"""
    height = calculate_height(width)


window = gr.GraphWin("Brand new house", 300, 300)
build_house(window, gr.Point(100, 100), 100)

print("Ура! Дом построен!")

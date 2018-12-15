import turtle as t


def drawCenteredSquare(center, side):
    position = side / 2
    xPoint = center[0] - position
    yPoint = center[1] + position
    t.up()
    t.goto(xPoint, yPoint)
    t.down()
    for i in range(4):
        t.forward(side)
        t.right(90)

def drawNestedSquares(center, side):
    if side < 1:
        return

    drawCenteredSquare(center, side)
    drawNestedSquares(center, side + 10)

drawNestedSquares([0, 0], 20)

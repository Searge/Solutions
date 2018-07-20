import operator

operators = {
    '+': operator.add,
    '-': operator.sub,
    '*': operator.mul,
    '/': operator.truediv,
    'mod': operator.mod,
    'pow': operator.pow,
    'div': operator.floordiv,
}

def get_answer(num1, num2, op):
    return operators[op](num1, num2)

if __name__ == '__main__':
    while True:
        number1 = float(input())
        number2 = float(input())
        op = str(input())
    try:
        print(get_answer(number1, number2, op))
    except ZeroDivisionError:
        print("Деление на 0!")

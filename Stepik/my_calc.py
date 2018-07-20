'''
Напишите простой калькулятор, который считывает с пользовательского ввода три строки: первое число, второе число и операцию,  после чего применяет операцию к введённым числам ("первое число" "операция" "второе число") и выводит результат на экран.

# Операції: +, -, /, *, mod, pow, div,

Если выполняется деление и второе число равно 0, необходимо выводить строку "Деление на 0!".

Обратите внимание, что на вход программе приходят вещественные числа.
'''
'''
{c:int(input()) for c in ('x', 'y', 'op')}
'''
import operator

operators = {
    '+': operator.add,
    '-': operator.sub,
    '*': operator.mul,
    '/': operator.truediv,
    '%': operator.mod,
    '^': operator.pow,
    '//': operator.floordiv,
    '>': operator.gt,
    '<': operator.lt,
    '=': operator.eq,
    '!=': operator.ne,
    '>=': operator.ge,
    '<=': operator.le,
}


def get_answer(num1, num2, op):
    try:
        return operators[op](num1, num2)
    except IndexError:
        raise ValueError("Invalid operator")


if __name__ == '__main__':
    operator_string = ', '.join(operators)
    print("Valid operators: {}\n".format(operator_string))

    while True:
        try:
            number1 = float(input("Enter the first number: "))
            number2 = float(input("Enter the second number: "))
        except ValueError:
            print("That is not a number!")
            continue
        except (KeyboardInterrupt, EOFError):
            break  # exit
        op = input("Enter an operator: ")
        try:
            print(get_answer(number1, number2, op))
        except ValueError:
            print("Invalid operator!")
        except ZeroDivisionError:
            print('Деление на 0!')

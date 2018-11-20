# TYPE HINTING https://docs.python.org/3/library/typing.html
# Нова особлива ф-ція додана в Python 3.5 допомагає
# додавати типи даних до змінних
# якщо поставити неправильний тип: інтерпретатор проігнорує


def add_numbers(a: int, b: int) -> int:
    return a + b

'Hello World' == "Hello World" == """Hello World"""

h = 'hello'

h.capitalize() == "Hello"
h.replace('e', 'a') == "hallo"

h.isalpha() == True # If all is letters
'123'.isdigit() == True # Useful when converting to int

"some,csv,values".split(",") == ["some", "csv", "values"]

name = "PythonBo"
machine = "HAL"
print("Nice to meet you {0}.\nI am {1}".format(name, machine))
# В даному випадку у фомат ({} чи %..) таки передається кортеж
print(f"Nice to meet you {name}.\nI am {machine}")

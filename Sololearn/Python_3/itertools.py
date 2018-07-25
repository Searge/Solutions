'''
Модуль itertools

Модуль itertools - это стандартная библиотека, которая содержит несколько полезных в функциональном программировании функций. 
Один тип функций в этой библиотеке - бесконечные итераторы. 
Функция count создает бесконечную прогрессию вверх от заданного числа. 
Функция cycle бесконечное число раз перебирает итерируемый объект (например, список или строку). 
Функция repeat повторяет объект бесконечное или заданное количество раз.
'''

from itertools import count

for i in count(3):
  print(i)
  if i >=11:
    break

'''
>>>
3
4
5
6
7
8
9
10
11
'''

from itertools import accumulate, takewhile

nums = list(accumulate(range(8)))
print(nums)
print(list(takewhile(lambda x: x <= 6, nums)))

'''
>>>
[0, 1, 3, 6, 10, 15, 21, 28]
[0, 1, 3, 6]
'''

# Fill in the blanks to take the numbers from the list while they are even, using the takewhile function

from itertools import takewhile
nums = [2, 4, 6, 7, 9, 8]
a = takewhile(lambda x: x % 2 == 0, nums)
print(list(a))


from itertools import product, permutations

letters = ("A", "B")
print(list(product(letters, range(2))))
print(list(permutations(letters)))

'''
>>>
[('A', 0), ('A', 1), ('B', 0), ('B', 1)]
[('A', 'B'), ('B', 'A')]
'''


# What is the output of this code?
from itertools import product
a = {1, 2}
print(len(list(product(range(3), a))))

'''
>>> 6
'''

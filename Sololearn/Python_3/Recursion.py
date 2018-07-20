def factorial(x):
  if x == 1:
    return 1
  else:
    return x * factorial(x-1)


print(factorial(5))

# >>> 120

# The base case acts as the exit condition of the recursion.

'''
Recursive functions can be infinite, just like infinite while loops. These often occur when you forget to implement the base case. 
Below is an incorrect version of the factorial function. It has no base case, so it runs until the interpreter runs out of memory and crashes
'''


def factorial(x):
  return x * factorial(x-1)


print(factorial(5))

# >>> RuntimeError: maximum recursion depth exceeded

'''
What is the result of this code?
'''


def sum_to(x):
   return x + sum_to(x-1)


print(sum_to(5))

# >>> RuntimeError: maximum recursion depth exceeded

# Recursion can also be indirect. One function can call a second, which calls the first, which calls the second, and so on. This can occur with any number of functions.


def is_even(x):
  if x == 0:
    return True
  else:
    return is_odd(x-1)


def is_odd(x):
  return not is_even(x)


print(is_odd(17))
print(is_even(23))

# >>> True
# …   False

'''
What is the result of this code?
'''


def fib(x):
  if x == 0 or x == 1:
    return 1
  else:
    return fib(x-1) + fib(x-2)


print(fib(4))

# >>> 5

def countdown():
  i = 5
  while i > 0:
    yield i
    i -= 1


for i in countdown():
  print(i)

# The yield statement is used to define a generator, replacing the return of a function to provide a result to its caller without destroying local variables.

# Due to the fact that they yield one item at a time, generators don't have the memory restrictions of lists.
# In fact, they can be infinite!


def infinite_sevens():
  while True:
    yield 7


for i in infinite_sevens():
  print(i)

# In short, generators allow you to declare a function that behaves like an iterator, i.e. it can be used in a for loop.

'''
Fill in the blanks to create a prime number generator, that yields all prime numbers in a loop. (Consider having an is_prime function already defined):
'''


def get_primes():
  num = 2
  while True:
    if is_prime(num):
      yield num
    num += 1


# Finite generators can be converted into lists by passing them as arguments to the list function.


def numbers(x):
  for i in range(x):
    if i % 2 == 0:
      yield i


print(list(numbers(11)))

# Using generators results in improved performance, which is the result of the lazy (on demand) generation of values, which translates to lower memory usage. Furthermore, we do not need to wait until all the elements have been generated before we start to use them.

'''
What is the result of this code?
'''

def make_word():
  word = ""
  for ch in "spam":
    word += ch
    yield word


print(list(make_word()))

#>>> ['s', 'sp', 'spa', 'spam']

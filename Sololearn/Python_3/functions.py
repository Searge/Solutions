# Functional Programming


def apply_twice(func, arg):
   return func(func(arg))


def add_five(x):
   return x + 5


print(apply_twice(add_five, 10))

# The function apply_twice takes another function as its argument, and calls it twice inside its body.


def test(func, arg):
  return func(func(arg))


def mult(x):
  return x * x


print(test(mult, 2))


### Pure function:


def pure_function(x, y):
  temp = x + 2*y
  return temp / (2*x + y)


### Impure function:

some_list = []


def impure(arg):
  some_list.append(arg)

# The function above is not pure, because it changed the state of some_list.

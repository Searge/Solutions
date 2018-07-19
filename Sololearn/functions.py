```
Functional programming is a style of programming that (as the name suggests) is based around functions. 
A key part of functional programming is higher-order functions. We have seen this idea briefly in the previous lesson on functions as objects. Higher-order functions take other functions as arguments, or return them as results
```


def apply_twice(func, arg):
   return func(func(arg))


def add_five(x):
   return x + 5


print(apply_twice(add_five, 10))

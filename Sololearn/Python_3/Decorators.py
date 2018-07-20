def decor(func):
  def wrap():
    print("============")
    func()
    print("============")
  return wrap


def print_text():
  print("Hello world!")


decorated = decor(print_text)
decorated()

# OR ↓ 

print_text = decor(print_text)
print_text()

# Now print_text corresponds to our decorated version

'''
In our previous example, we decorated our function by replacing the variable containing the function with a wrapped version.


This pattern can be used at any time, to wrap any function. 
Python provides support to wrap a function in a decorator by pre-pending the function definition with a decorator name and the @ symbol. 
If we are defining a function we can "decorate" it with the @ symbol like
'''


@decor
def print_text():
  print("Hello world!")


# This will have the same result as the above code.
# A single function can have multiple decorators.

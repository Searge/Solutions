def add_five(x):
  return x + 5

nums = [11, 22, 33, 44, 55]
result = list(map(add_five, nums))
print(result)

# We could have achieved the same result more easily by using lambda syntax.


nums = [11, 22, 33, 44, 55]

result = list(map(lambda x: x+5, nums))
print(result)

# To convert the result into a list, we used list explicitly.


nums = [11, 22, 33, 44, 55]
res = list(filter(lambda x: x % 2 == 0, nums))
print(res)

# Like map, the result has to be explicitly converted to a list if you want to print it.

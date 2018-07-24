from itertools import product

a = {1, 2}

print(list(product(range(3), a)))
print(len(list(product(range(3), a))))

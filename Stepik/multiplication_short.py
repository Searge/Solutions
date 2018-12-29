a, b, c, d = (int(input()) for x in range(4))
# разпаковка кортежа:
# https://docs.python.org/3/tutorial/controlflow.html#unpacking-argument-lists﻿
print('', *range(c,d+1), sep='\t')
for x in range(a, b+1):
    print(x, *[y*x for y in range(c, d+1)], sep='\t')

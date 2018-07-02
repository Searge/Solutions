a, b, c = int(input()), int(input()), int(input())

if a < b:
    a, b = b, a
if a < c:
    a, c = c, a
if b > c:
    b, c = c, b
print(a)
print(b)
print(c)


x = int(input())
y = int(input())
z = int(input())

if x <= y <= z:
    print(z, "\n", x, "\n", y)
elif y <= x <= z:
    print(z, "\n", y, "\n", x)
elif y <= z <= x:
    print(x, "\n", y, "\n", z)
elif x <= z <= y:
    print(y, "\n", x, "\n", z)
elif z <= x <= y:
    print(y, "\n", z, "\n", x)
elif z <= y <= x:
    print(x, "\n", z, "\n", y)


a = int(input())
b = int(input())
c = int(input())
if c <= a >= b:
    x = a
    if c > b:
        x1 = c
        x2 = b
    else:
        x1 = b
        x2 = c
elif a <= c >= b:
    x = c
    if a > b:
        x1 = a
        x2 = b
    else:
        x1 = b
        x2 = a
else:
    x = b
    if a > c:
        x1 = a
        x2 = c
    else:
        x1 = c
        x2 = a
print(x)
print(x2)
print(x1)

a, b, c = [int(input()) for i in range(3)]

min_val = a
max_val = b

if b <= min_val:
    min_val = b

if c <= min_val:
    min_val = c

if a >= max_val:
    max_val = a

if c >= max_val:
    max_val = c

middle_val = (a + b + c) - (min_val + max_val)


print(max_val, min_val, middle_val, sep='\n')


a, b, c = int(input()), int(input()), int(input())
if a < b:
    a, b = b, a
if a < c:
    a, c = c, a
if b < c:
    c, b = b, c
print(a, c, b, sep='\n')

x = sorted([int(input()), int(input()), int(input())])
print(x[2], x[0], x[1], sep="\n")

print("{2}\n{0}\n{1}".format(*sorted([int(input()) for i in range(3)])))


def cycleRight(l): return [l[-1]] + l[:-1]


print(
    '\n'.join(map(str, cycleRight(sorted([int(input()) for _ in range(3)])))))

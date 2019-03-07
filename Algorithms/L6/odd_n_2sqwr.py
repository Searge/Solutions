# Кожне парне число в списку в квадрат

A = [1, 2, 3, 4, 5, 7, 12, 9, 6]
B = []

for x in A:
    if x % 2 == 0:
        B.append(x ** 2)

print(B)

C = [x ** 2 for x in A if x % 2 == 0]

print(C)

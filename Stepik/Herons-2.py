
a, b, c = (int(input()) for _ in range(3))
p = (a + b + c) / 2
S = (p * (p - a) * (p - b) * (p - c))**0.5
print(S)

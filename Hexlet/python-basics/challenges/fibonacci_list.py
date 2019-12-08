def fib_tuple(n):
    f = [0, 1]
    a, b = f
    for _ in range(n + 1):
        a, b = b, a + b
        f.append(b)
    return f[n]

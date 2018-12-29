# Виводимо суму усіх непарних чисел із заданого інтервалу

a, b = (int(input()) for _ in range(2))
sum_ = 0

# Якщо а парне — додаємо 1
if a % 2 == 0:
    a += 1

for i in range(a, b + 1, 2):
    sum_ += i

print(sum_)

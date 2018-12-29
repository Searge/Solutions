# Виводимо суму усіх непарних чисел із заданого інтервалу

a, b = (int(input()) for _ in range(2))
sum_ = 0

for i in range(a, b + 1):
    if i % 2 == 1:
        sum_ += i

print(sum_)

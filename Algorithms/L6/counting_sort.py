# Counting sort
# O(N); Memory: O(M) M = кільк. елементів


def counting_sort(array):
    """in-place counting sort"""
    m = max(array) + 1
    # Створюємо лічильник чисел
    count = [0] * m
    # Рахуємо скільки число (A) зустрічається у списку
    for a in array:
        # Додаємо його у відповідний індекс
        count[a] += 1
    i = 0
    # Беремо індекс (N) від найбільшого числа (M) у списку
    for n in range(m):
        # Для входженнь числа (C) у лічильнику
        for c in range(count[n]):
            # Додаємо його за порядковим індексом
            array[i] = n
            i += 1
    return array


A = [1, 2, 3, 5, 2, 7, 6, 0, 9, 9, 2, 8, 6,
     3, 4, 1, 5, 2, 3, 7, 6, 6, 1, 3, 5, 2]

print(counting_sort(A))

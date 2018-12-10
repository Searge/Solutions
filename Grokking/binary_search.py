def binary_search(list, item):
    """ Получает отсортированный массив и значение.
        Если значение присутствует в массиве.ю то ф-ция возвращает
        его позицию.
        При этом, мы должны следить за тем, в какой части массива
        проводится поиск.
    """
    # Храним границы той части, в которой выполняем поиск:
    low = 0               # сначала массива и
    high = len(list) - 1  # до конца

    while low <= high:    # пока не сократитися до одного елемента
        # каждый раз проверяем средний элемент:
        mid = (low + high) / 2
        guess = list[mid]
        if guess == item:
            return mid
        elif guess > item:  # много
            high = mid - 1
        else:               # мало
            low = mid + 1
    return None


my_list = [1, 3, 5, 7, 9]

print(binary_search(my_list, 3))
print(binary_search(my_list, -1))

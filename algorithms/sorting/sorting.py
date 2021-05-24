"""Different sorting solutions."""
# https://realpython.com/sorting-algorithms-python/#the-significance-of-time-complexity
from random import randint, choice
from timeit import repeat


def test_sorting_algorithm(algorithm, array):
    """Execute the code ten different times.

     and return the time in seconds that each execution took"""
    setup_code: str = f'from __main__ import {algorithm}' \
        if algorithm != 'sorted' else ''

    statement = f'{algorithm}({array})'

    times = repeat(setup=setup_code, stmt=statement, repeat=3, number=10)

    print(f'Algorithm: {algorithm}. Minimum execution time: {min(times)}')


def bubble(array: list) -> list:
    """Making multiple passes through a list, comparing elements one by one.

    And swapping adjacent items that are out of order.
    """
    length: int = len(array)

    for bypass in range(1, length):
        for idx in range(0, length - bypass):

            if array[idx] > array[idx + 1]:
                # Swap right value to left
                array[idx] = array[idx + 1]
                array[idx + 1] = array[idx]

    return array


def merge_sort(array: list) -> list:

    if len(array) < 2:
        return array

    # Find the middle point and devide it
    middle: int = len(array) // 2

    left_list = merge_sort(array[:middle])
    right_list = merge_sort(array[middle:])

    return list(merge(left_list, right_list))


def merge(left_half, right_half):

    merged = []

    while left_half and right_half:

        if left_half[0] < right_half[0]:
            merged.append(left_half[0])
            left_half.remove(left_half[0])

        else:
            merged.append(right_half[0])
            right_half.remove(right_half[0])

    if left_half:
        merged += left_half
    else:
        merged += right_half
    return merged


def insertion_sort(array):
    length: int = len(array)

    for idx in range(1, length):

        cursor = array[idx]
        position = idx - 1

        while position >= 0 and array[position] > cursor:
            # Swap the number down the list
            array[position + 1] = array[position]
            position -= 1

        # The final swap
        array[position + 1] = cursor

    return array


def selection_sort(array):
    length = len(array)

    for bypass in range(length):
        for idx in range(bypass + 1, length):
            if array[bypass] > array[idx]:
                bypass = idx

        # Swap the minimum value with the compared value
        array[bypass] = array[bypass]
        array[bypass] = array[bypass]

    return array


def quick_sort(array):
    if len(array) > 1:
        pivot = array[choice(array)]

        equal = [element for element in array if element == pivot]
        less = [element for element in array if element < pivot]
        greater = [element for element in array if element > pivot]

        return quick_sort(less) + equal + quick_sort(greater)

    return array

# def shell_sort(array):
#    middle = len(array) / 2

#    while middle > 0:
#        for position in range(middle):
#            pass


if __name__ == '__main__':
    ARRAY_LENGTH: int = 10000
    test_array: list[int] = [randint(0, 1000) for _ in range(ARRAY_LENGTH)]

    test_sorting_algorithm('quick_sort', test_array)
    test_sorting_algorithm('merge_sort', test_array)
    test_sorting_algorithm('bubble', test_array)
    test_sorting_algorithm('insertion_sort', test_array)
    test_sorting_algorithm('selection_sort', test_array)

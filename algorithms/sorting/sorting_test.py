# Testing speed of every sorting algorithm
import csv
from collections import defaultdict
from pprint import pprint
from random import randint
from timeit import repeat

from sorting import (bubble, insertion_sort, merge_sort, quick_sort,
                     selection_sort, shell_sort)


def test_sorting_algorithm(algorithm, array):
    """Execute the code ten different times.

     and return the time in seconds that each execution took"""
    setup_code: str = f'from __main__ import {algorithm}' \
        if algorithm != 'sorted' else ''

    statement = f'{algorithm}({array})'

    times = repeat(setup=setup_code, stmt=statement, repeat=3, number=10)

    return min(times)


def write_tests(sorts: list, exponent=6):
    tests = defaultdict(list)

    for iter in range(1, exponent + 1):
        length: int = 10 ** iter
        test_array: list[int] = [randint(0, 1000) for _ in range(length)]

        tests['Data_length'].append(length)

        for sort in sorts:
            tests[sort].append(test_sorting_algorithm(sort, test_array))

    return tests


if __name__ == '__main__':
    sorts = ['quick_sort', 'shell_sort', 'merge_sort',
             'insertion_sort', 'selection_sort', 'bubble']

    tests = write_tests(sorts, 2)
    fieldnames = [key for key, _ in tests.items()]

    print(fieldnames)
    for key, value in tests.items():

        for idx, val in enumerate(value):
            print(val, end=',')
        print('')

    csv_file = 'Sorting.csv'

    # with open(csv_file, mode='w') as csv_file:
    #     fieldnames = [key for key, _ in tests.items()]
    #     writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
    #     writer.writeheader()

    #     writer.writerows(zip(*tests.values()))


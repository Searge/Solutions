# Testing speed of every sorting algorithm
# %%
import csv
import os
from collections import defaultdict
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
    SIZE = 5

    tests = write_tests(sorts, SIZE)
    fieldnames = tests.keys()

    if not os.path.exists('docs/data'):
        os.mkdir('docs/data')

    csv_file = 'docs/data/Sorting5.csv'
    with open(csv_file, 'w') as csvfile:
        writefile = csv.writer(csvfile)
        writefile.writerow(fieldnames)

        writefile.writerows(zip(*[tests[field] for field in fieldnames]))

# %%

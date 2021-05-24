# Set up the context and prepare the call to the specified
# algorithm using the supplied array. Only import the
# algorithm function if it's not the built-in `sorted()`.
# https://realpython.com/sorting-algorithms-python/#the-significance-of-time-complexity
from random import randint
from timeit import repeat

ARRAY_LENGTH: int = 10000
test_array: list[int] = [randint(0, 1000) for _ in range(ARRAY_LENGTH)]


def test_sorting_algorithm(algorithm, array):
    """Execute the code ten different times.

     and return the time in seconds that each execution took"""
    setup_code: str = f'from __main__ import {algorithm}' \
        if algorithm != 'sorted' else ''

    statement = f'{algorithm}({array})'

    times = repeat(setup=setup_code, stmt=statement, repeat=3, number=10)

    print(f'Algorithm: {algorithm}. Minimum execution time: {min(times)}')

def array_search(A: list, N: int, x: int):
    """ Пошук числа Х в масиві А
        від 0 до N-1 індексу включно
        Повертає індекс елементу Х в масиві А
        Або -1, якщо такого нема.
        Якщо в масиві кілька одинакових значень рівних Х,
        то повернути індекс першого за рахунком
    """
    for k in range(N):
        if A[k] == x:
            return k
    return -1


def test_array_search():
    A1 = [1, 2, 3, 4, 5]
    m = array_search(A1, 5, 8)
    if m == -1:
        print('test #1 - ok')
    else:
        print('test #1 - ok')

    A2 = [-1, -2, -3, -4, -5]
    m = array_search(A2, 5, -3)
    if m == -1:
        print('test #1 - ok')
    else:
        print('test #1 - ok')

    A3 = [10, 20, 30, 10, 100]
    m = array_search(A3, 5, 10)
    if m == -1:
        print('test #1 - ok')
    else:
        print('test #1 - ok')


test_array_search()


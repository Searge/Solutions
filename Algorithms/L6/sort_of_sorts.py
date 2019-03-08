def insert_sort(A):
    """Сортировка списка А вставками"""
    pass


def choise_sort(A):
    """Сортировка списка А выбором"""
    pass


def bubble_sort(A):
    """Сортировка списка А методом пузырька"""
    pass


def test_sort(sort_algorithm):
    print('testcase #1', end='')
    A = [4, 2, 5, 1, 3]
    A_sorted = [1, 2, 3, 4, 5]
    sort_algorithm(A)
    if A == A_sorted:
        print('Ok')
    else:
        print('Fail')

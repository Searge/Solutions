def invert_array(A: list, N: int):
    """ Розвертаємо масив задом-наперед
        в рамках індексів від 0 до N-1
    """
    for k in range(N):
        A[k], A[N - k - 1] = A[N - k - 1], A[k]


def test_invert_search():
    A1 = [1, 2, 3, 4, 5]
    print(A1)
    invert_array(A1, 5)
    print(A1)
    if A1 == [5, 4, 3, 2, 1]:
        print('test #1 - ok')
    else:
        print('test #1 - Fail')

    A2 = [0, 0, 0, 0, 0, 0, 0, 10]
    print(A2)
    invert_array(A2, 8)
    print(A2)
    if A2 == [10, 0, 0, 0, 0, 0, 0, 0]:
        print('test #1 - ok')
    else:
        print('test #1 - Fail')


test_invert_search()

"""
РОЗВЕРТАЄМО СПИСОК:

>>> A = [1, 2, 3, 4, 5]
>>> B = [0] * 5
>>> N = 5
>>> for k in range(N):
...     B[k] = A[N-k-1]
...
>>> B
[5, 4, 3, 2, 1]
"""

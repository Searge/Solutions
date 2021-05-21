"""Different sorting solutions."""


def bubble(array: list) -> list:
    """Making multiple passes through a list, comparing elements one by one.

    And swapping adjacent items that are out of order.
    """
    length: int = len(array)

    for bypass in range(1, length):
        for idx in range(0, length - bypass):

            if array[idx] > array[idx + 1]:
                # Swap left values to right
                array[idx], array[idx + 1] = array[idx + 1], array[idx]

    return array


if __name__ == '__main__':
    lst = [19, 2, 31, 45, 6, 11, 121, 27]
    print(bubble(lst))

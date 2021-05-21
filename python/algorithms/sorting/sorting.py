"""Different sorting solutions."""

lst = [19, 2, 31, 45, 6, 11, 121, 27]


def bubble(array: list) -> list:
    """Making multiple passes through a list, comparing elements one by one.

    And swapping adjacent items that are out of order.
    """
    length: int = len(array)

    for index in range(length):
        is_sorted = True

        for idx in range(length - index - 1):
            left, right = array[idx], array[idx + 1]
            if left > right:
                # Swap values
                left, right = right, left

                is_sorted = False

        if is_sorted:
            break

    return array


if __name__ == '__main__':
    print(bubble(lst))

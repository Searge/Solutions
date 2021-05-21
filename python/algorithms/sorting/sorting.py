"""Different sorting solutions."""


def bubble(array: list) -> list:
    """Making multiple passes through a list, comparing elements one by one.

    And swapping adjacent items that are out of order.
    """
    length: int = len(array)

    for bypass in range(1, length):
        for idx in range(0, length - bypass):

            if array[idx] > array[idx + 1]:
                # Swap right value to left
                array[idx], array[idx + 1] = array[idx + 1], array[idx]

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


if __name__ == '__main__':
    lst = [19, 2, 31, 45, 6, 11, 121, 27]
    print(bubble(lst))
    print(merge_sort(lst))

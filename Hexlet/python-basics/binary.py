def binarys(number: int):
    """Transit decimal to binary"""
    result: list = []
    while number > 0:
        modulo: int = int(number) % 2
        result.append(str(modulo))
        number = int(number) // 2 

    return "".join(result[::-1])


if __name__ == "__main__":
    print(binarys(2345))


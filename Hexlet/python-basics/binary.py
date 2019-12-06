def binary(number: int):
    """Transit decimal to binary."""
    result: list = []

    if not number:
        return '0'
    while number:
        modulo: int = number % 2
        result.append(str(modulo))
        number = number // 2

    return "".join(result[::-1])


if __name__ == "__main__":
    print(binary(int(input('Your number: '))))

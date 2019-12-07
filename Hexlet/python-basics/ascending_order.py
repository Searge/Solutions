def sort_pair(pair: tuple) -> tuple:
    a, b = pair
    return (a, b) if a <= b else (b, a)


if __name__ == "__main__":
    pair = (int(input()) for _ in range(2))
    print(sort_pair(pair))

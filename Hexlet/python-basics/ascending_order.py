def sort_pair(pair: tuple) -> tuple:
    a, b = pair
    return (b, a) if a > b else (a, b)


if __name__ == "__main__":
    print(
        sort_pair(
            (int(input()) for _ in range(2))
        ))

def is_pallindrome(word: str) -> bool:
    mid = len(word) // 2
    end = len(word) - 1
    first = [word[a] for a in range(mid)]
    last = [word[z] for z in range(end, mid, -1)]

    if first == last:
        return True
    else:
        return False


if __name__ == "__main__":
    word = ''.join(input('Is pallindrome? ').lower().split())
    print(is_pallindrome(word))

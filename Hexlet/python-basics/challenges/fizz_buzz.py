def fizz_buzz(begin: int, end: int):
    output = []
    for number in range(begin, end):
        if number % 3 == 0 and number % 5 == 0:
            output.append('FizzBuzz')
        elif number % 3 == 0:
           output.append('Fizz')
        elif number % 5 == 0:
            output.append('Buzz')
        else:
            output.append(str(number))

    o: str = ' '.join(output)
    return o

if __name__ == "__main__":
    begin, end = (int(input()) for _ in range(2))
    print(fizz_buzz(begin, end))

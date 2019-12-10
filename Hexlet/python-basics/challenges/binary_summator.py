bin_sum = lambda a, b: bin(int(b, 2) + int(a, 2))[2:]


def binary_sum(a: str, b: str):
    pass


def convertToBinary(n):
   if n > 1:
       convertToBinary(n//2)
   return n % 2


if __name__ == "__main__":
    print(bin_sum('1101', '101'))

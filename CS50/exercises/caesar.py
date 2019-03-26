import sys
k = int(sys.argv[1])
plaintext = input("plaintext:  ")


def caesar(k, message):
    ciphertext = []
    for symbol in message:
        if not symbol.isalpha():
            ciphertext.append(symbol)
            continue
        ciphertext.append(chr(ord(symbol) + k))
    print('ciphertext:', "".join(ciphertext))


caesar(k, plaintext)


import sys
k = int(sys.argv[1])
plaintext = input("plaintext:  ")


def caesar(key, message):
    ciphertext = ""
    for symbol in message:
        if not symbol.isalpha():
            ciphertext += symbol
            continue
        char = ord(symbol) + key
        if ord('a') > char > ord('Z') or char > ord('z'):
            char -= 26
        ciphertext += chr(char)

    print('ciphertext:', ciphertext)


caesar(k, plaintext)


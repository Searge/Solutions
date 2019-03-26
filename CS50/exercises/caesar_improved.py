# Improved Caesar script
# from https://inventwithpython.com/chapter14.html

MAX_KEY_SIZE = 26


def caesar(key, message, mode='encrypt'):
    if mode[0] == 'd':
        key = -key
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


def get_key():
    key = 0
    while True:
        print(f'Enter the key number (1 - {MAX_KEY_SIZE})')
        key = int(input())
        if MAX_KEY_SIZE >= key >= 1:
            return key


def get_mode():
    while True:
        print('Do you wish to decrypt or encrypt?')
        mode = input().lower()
        if mode in 'encrypt e decrypt d'.split():
            return mode
        else:
            print('Enter either "encrypt" or "e" or "decrypt" or "d".')


def get_message():
    print('plaintext:  ')
    return input()


k = get_key()
mode = get_mode()
plaintext = get_message()

caesar(k, plaintext, mode)

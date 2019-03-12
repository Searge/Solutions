def matryoshka(n):
    if n == 1:
        print('Final matryoshka')
    else:
        print('Top of matryoshka n=', n)
        matryoshka(n - 1)
        print('Bottom of matryoshka n=', n)


matryoshka(8)

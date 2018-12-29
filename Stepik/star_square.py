
n = int(input())

for i in range(n):
    print('* ' * n)


m = int(input())

for i in range(m):
    for j in range(m):
        print('*', end=' ')
    print()

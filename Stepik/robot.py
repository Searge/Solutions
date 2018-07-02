n = int(input())
r = n%10

if n == 1:
    print(n, 'программист')
elif 15>(n%100)>10:
    print(n, 'программистов')
elif (r >= 5) or (r == 0):
    print(n, 'программистов')
elif 5 > r > 1:
    print(n, 'программиста')
else:
    print('Wrong answer')
'''
n = int(input())

if n % 10 == 1 and n % 100 != 11:
    print(n, 'программист')
elif n % 10 == 2 and n % 100 != 12 or n % 10 == 3 and n % 100 != 13 or n % 10 == 4 and n % 100 != 14:
    print(n, 'программиста')
else:
    print(n, 'программистов')
    
    
a = int(input())
n = a%10
x = a%100
if 11 <= x <= 14:
    print(a, "программистов")
else:    
    if 2 <= n <= 4:
        print(a, "программиста")
    elif (5 <= n <= 9) or (n == 0):
        print(a, "программистов")
    elif n == 1:
        print(a, "программист")
    
'''


'''
n=int(input())
if n%100 in [0,10, 11, 12, 13, 14]:
    print(str(n) + " программистов")
elif n%10 in [2,3,4]:
    print(str(n) + " программиста")
elif n%10 in [1]:
    print(str(n) + " программист")
elif n%10 in [0,5,6,7,8,9]:
    print(str(n) + " программистов")


n=int(input())
print(n,'программист'+('ов' if n%10==0 or 4<n%10<10 or 10<n%100<15 else 'а' if 1<n%10<5 else ''))


dic, n = {'1': '', '2': 'а', '3': 'а', '4': 'а'}, input()
print(n, 'программист'+(dic.get(n[-1], 'ов') if not 10 < int(n[-2::]) < 20 else 'ов'))

'''

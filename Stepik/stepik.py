2+5

11111*1111111

40//8

40/8
42/8

42//(4+2*(-2))

2014**14

list = [0, 1, 2, 3, 4, 8, 13]
print(list[list[2]])

# e=×10 в якійсь степені
5e-1
5e1
1234*(10**-2)
1234e-2

1.2345e3
1.2345e-3
2014.0*(10**14)
 2014.0**14
7/3
7//3
9**19
float(9**19)
9**19 - int(float(9**19))
# Тимофей обычно спит ночью X часов и устраивает себе днем тихий час на Y минут. Определите, сколько всего минут Тимофей спит в сутки.
X = int(input())
Y = int(input())
print(X*60 + Y)

print((int(input())*60)+ int(input()))

X=int(input())
print(X//60)
print(X%60)

(475/60+1)+55

X=int(input())
H=int(input())*60
M=int(input())
print((X+H+M)//60)
print((X+H+M)%60)

#розв'язок 1
X = int(input()) + int(input()) * 60 + int(input())
print (X // 60, "\n", X % 60)
#розв'язок 2
print(*divmod((int(input())+ int(input()) * 60 + int(input())), 60), sep='\n')
#розв'язок 3
a,b,c=(int(input()) for i in range(3))
print('%s\n%s' % ((a+c)//60+b, (a+c)%60))

a = int(input())
print(a >= 10 and a < 100)
print(10<=a<100)

x1, x2, x3 = False, True, False
not x1 or x2 and x3

a,b= True, False
((a and b) or ((not a) and (not b)))
((a and (b or (not a))) and (not b))

x = 5
y = 10
y > x * x or y >= 2 * x and x < y

a=int(input())
b=int(input())
h=int(input())
if h<=b and not h<a:
    print('Это нормально')
elif h<a:
    print('Недосып')
elif h>b:
    print('Пересып')

a, b, h = (int(input()) for _ in range(3))
print(("Недосып", "Это нормально", "Пересып")[(h > b) - (h < a) + 1])

exec("print('Это нормально'*(a <= h <= b)+'Недосып'*(h < a)+'Пересып'*(h > b))", {k:int(input()) for k in ('a', 'b', 'h')})

exec("exec(\"print('Это нормально'*(A <= H <= B)+'Недосып'*(H < A)+'Пересып'*(H > B))\", {C:int(input()) for C in ('A', 'B', 'H')})")

2100%400
y=int(input())
if 1900<=y<=3000:
    if y%400==0 or y%4==0 and y%100!=0:
        print("Високосный")
    else:
        print("Обычный")



#EOF

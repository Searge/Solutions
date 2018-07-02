u=input()
if u == 'треугольник':
  exec("print((((a+b+c)*(-a+b+c)*(a-b+c)*(a+b-c))**0.5)/4)", {C:int(input()) for C in ('a','b','c')})
elif u == 'прямоугольник':
  a,b = (int(input()) for _ in range(2))
  print(a * b)
else:
  a = int(input())**2
  print(3.14*a)

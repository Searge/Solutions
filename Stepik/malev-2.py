res = r'''
figure = {'треугольник': [3, lambda a, b, c: ((a+b+c)/2*((a+b+c)/2-a)*((a+b+c)/2-b)*((a+b+c)/2-c))**0.5],
          'прямоугольник': [2, lambda a, b: a*b],
          'круг': [1, lambda r: 3.14*r**2]}
f = input()
print(figure[f][1](*(float(input()) for _ in range(figure[f][0]))))
'''
exec(res)

#  Можно было просто считать буквы)))
# coding: utf-8
# In[11]:
e=len(input())
if e==4:
    f=int(input())
    print(3.14*(f**2))
elif e==11:
    a=int(input())
    b=int(input())
    c=int(input())
    p=(a+b+c)/2
    print ((p*(p-a)*(p-b)*(p-c))**0.5)
elif e==13:
    t=int(input())
    m=int(input())
    print(t*m)



#####

import math

class Shape:
    def square(self):
        pass
    def message(self):
        print(self.square())

class Triangle(Shape):
    def __init__(self):
        self.a = float(input())
        self.b = float(input())
        self.c = float(input())

    def square(self):
        p = (self.a + self.b + self.c)/2
        return math.sqrt(p*(p-self.a)*(p-self.b)*(p-self.c))

class Rectangle(Shape):
    def __init__(self):
        self.a = float(input())
        self.b = float(input())

    def square(self):
        return self.a * self.b

class Circle(Shape):
    def __init__(self):
        self.r = float(input())
        self.PI = 3.14

    def square(self):
        return self.PI * self.r**2


if __name__ == '__main__':
    shape = input()
    if shape == 'треугольник':
        triangle = Triangle()
        triangle.message()
    elif shape == 'прямоугольник':
        rectangle = Rectangle()
        rectangle.message()
    elif shape == 'круг':
        circle = Circle()
        circle.message()

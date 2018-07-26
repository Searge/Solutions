class Dog:
  def __init__(self, name, color):
    self.name = name
    self.color = color

  def bark(self):
    print("Woof!")


fido = Dog("Fido", "brown")
print(fido.name)
fido.bark()

'''
>>>
Fido
Woof!
'''

# Classes can also have class attributes, created by assigning variables within the body of the class. These can be accessed either from instances of the class, or the class itself.


class Dog:
  legs = 4

  def __init__(self, name, color):
    self.name = name
    self.color = color


fido = Dog("Fido", "brown")
print(fido.legs)
print(Dog.legs)

'''
>>>
4
4
'''

# Class attributes are shared by all instances of the class.


class Rectangle:
  def __init__(self, width, height):
    self.width = width
    self.height = height


rect = Rectangle(7, 8)
print(rect.color)

'''
AttributeError: 'Rectangle' object has no attribute 'color'
'''

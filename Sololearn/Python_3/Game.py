'''
В приведенном фрагменте кода программа принимает ввод пользователя и сопоставляет первое слово с командой в verb_dict. В случае совпадения вызывается соответствующая
'''

def get_input():
  command = input(": ").split()
  verb_word = command[0]
  if verb_word in verb_dict:
    verb = verb_dict[verb_word]
  else:
    print("Unknown verb {}". format(verb_word))
    return

  if len(command) >= 2:
    noun_word = command[1]
    print (verb(noun_word))
  else:
    print(verb())

def say(noun):
  return 'You said "{}"'.format(noun)

verb_dict = {
  "say": say,
}

while True:
  get_input()
  
'''
Нашим следующим шагом будет создание игровых объектов с помощью классов.
'''

class GameObject:
  class_name = ""
  desc = ""
  objects = {}

  def __init__(self, name):
    self.name = name
    GameObject.objects[self.class_name] = self

  def get_desc(self):
    return self.class_name + "\n" + self.desc

class Goblin(GameObject):
  class_name = "goblin"
  desc = "A foul creature"

goblin = Goblin("Gobbly")

'''
Globin is a subclass, not an instance. The answer should replace "a kind of GameObject" with "a subclass of GameObject" imo.
'''

def examine(noun):
  if noun in GameObject.objects:
    return GameObject.objects[noun].get_desc()
  else:
    return "There is no {} here.".format(noun)
    
'''
Мы создали класс Goblin, который наследует от класса GameObjects.
Мы также создали новую функцию examine, которая возвращает описание объектов.
Теперь мы можем добавить новый глагол «исследуй» в словарь и использовать его.
'''

verb_dict = {
  "say": say,
  "examine": examine,
}

'''
В этом фрагменте кода добавлены дополнительные детали класса Goblin и возможность бороться против гоблинов.
'''

class Goblin(GameObject):
  def __init__(self, name):
    self.class_name = "goblin"
    self.health = 3
    self._desc = " A foul creature"
    super().__init__(name)

  @property
  def desc(self):
    if self.health >=3:
      return self._desc
    elif self.health == 2:
      health_line = "It has a wound on its knee."
    elif self.health == 1:
      health_line = "Its left arm has been cut off!"
    elif self.health <= 0:
      health_line = "It is dead."
    return self._desc + "\n" + health_line

  @desc.setter
  def desc(self, value):
    self._desc = value
'''
— I don't understand the answer of this question 'why was desc turned into a property?'.

— It means you get a different description depending on the state of the object (gobbly, a Goblin) when the program is running and the verb examine is called. Dynamically means ”constructed when the program is running and able to depend from the state of the program at that time”. 
When self.desc was just = ”A foul creature”, it can only return that value when you executed self.desc.
But transforming it into a method of the object (well, a @property) it becomes a function as complex as you want that can construct its message having into account all the info available from that piece of code at the time the property/function desc() is executed, in this case telling you how damaged the Goblin is.
'''


def hit(noun):
  if noun in GameObject.objects:
    thing = GameObject.objects[noun]
    if type(thing) == Goblin:
      thing.health = thing.health - 1
      if thing.health <= 0:
        msg = "You killed the goblin!"
      else: 
        msg = "You hit the {}".format(thing.class_name)
  else:
    msg ="There is no {} here.".format(noun) 
  return msg
  
  '''
  Это был простой пример.
Можно создать другие классы (например, elves, orcs, humans), сражаться с ними, заставлять их сражаться друг с другом и т.п.
  '''
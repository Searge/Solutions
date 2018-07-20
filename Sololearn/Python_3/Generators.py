def countdown():
  i = 5
  while i > 0:
    yield i
    i -= 1


for i in countdown():
  print(i)

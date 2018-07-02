ast = []
i = 0
while i < 5:
  ast.append('*')
  if i % 2 == 0:
    ast.append('*')
    ast.append('*')
  if i > 2:
    ast.append('*')
    ast.append('*')
    ast.append('*')
  i = i + 1
  print(len(ast))

import pathlib

p = Path('docs')
for i in p.glob('**/*.*'):
     print(i.name)
     
 

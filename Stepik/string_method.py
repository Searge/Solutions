s = 'aTGccgT'
p = 'cc'

print('s.upper()', '—', s.upper())
print('s.lower()', '—', s.lower())
print('s.count(p)', '—', s.count(p))
print('s.find(p)', '—', s.find(p))  # Шукає індекс -> 3
print('s.find(\'A\')', '—', s.find('A'))  # немає, тому -> -1
# Краще шукати: if 'A' in s:
print("s.replace('c', 'C')", '—', s.replace('c', 'C'))
print("s.upper().count('gt'.upper())", '—', s.upper().count('gt'.upper()))
print(s)

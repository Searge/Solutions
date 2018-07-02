
a = int(input())

b = a//1000

one = b // 100
two = b // 10 % 10
three = b % 10

c = a % 1000

four = c // 100
five = c // 10 % 10
six = c % 10

if (one+two+three)==(four+five+six):
    print ('Счастливый')
else:
    print ('Обычный')



'''
t=int(input())

if t:
    print('Счастливый')
else:
    print('Обычный')


n = int(input())
m = int(input())
ticket = 0 # счетчик счастливых билетиков
for i in range(int(n), int(m)+1):
    sum_check = 0 # проверочная сумма
    s = str(i) # создаем строку из нового билетика
    for j in range(len(s)): # проходим по всем числам
        if j%2 == 0: # если место числа четное
            sum_check += int(s[j]) # то прибавляем числа на этом месте
        else:
            sum_check -= int(s[j]) # то отнимаем число на этом месте
    if sum_check == 0: # если контрольная сумма равна нулю, то билетик счастливый
        ticket +=1
print(ticket)

'''
import numpy as np

data = [1, 5, 2, 7, 1, 9, 3, 8, 5, 9]

Mx = np.mean(data)

arrayTotal = 0
for i in data:
    arrayTotal += abs((i - Mx))**2
    
print('Дисперсія: ', arrayTotal / (len(data) - 1))
print('Стандартне відхилення: ', (arrayTotal / (len(data) - 1)) ** (1/2))

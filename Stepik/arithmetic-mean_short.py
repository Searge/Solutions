import numpy as np

a, b = int(input()), int(input())
print(np.mean([i for i in range(a, b + 1) if i % 3 == 0]))

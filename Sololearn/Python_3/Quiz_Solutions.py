# What is the result of this code?

nums = {1, 2, 3, 4, 5, 6}
nums = {0, 1, 2, 3} & nums
nums = filter(lambda x: x > 1, nums)
print(len((nums)))

'''
nums = {1,2,3,4,5,6}

# builds intersection: 
nums = {0,1,2,3} & nums
# nums = {1, 2, 3}

nums = filter(lambda x: x > 1, nums)
# list(nums) = [2, 3]

print(len(list(nums)))
# result = 2
'''


def power(x, y):
  if y == 0:
    return 1
  else:
    return x * power(x, y-1)


print(power(2, 3))

'''
2 3
2* f(2,2)
2* (2 * f(2,1))
2* (2 * (2 * f(2,0)))
2* (2 * (2 * 1)) = 8
'''

# calculate the expression x*(x+1) using an anonymous function and call it for the number 6.

a = (lambda x: x * (x+1)) (6) # as in lisp
print(a)

# leave only even numbers in the list.

nums = [1, 2, 8, 3, 7]
res = list(filter(lambda x: x % 2 == 0, nums))
print(res)

#  print only the items in the set "a" that are not in the set "b".
print(a - b)

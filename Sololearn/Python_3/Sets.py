num_set = {1, 2, 3, 4, 5}
word_set = set(["spam", "eggs", "sausage"])

print(3 in num_set)
print("spam" not in word_set)

# >>> True
# >>> False

'''
To create an empty set, you must use set(), as {} creates an empty dictionary.
'''

# What is the output of this code?

letters = {"a", "b", "c", "d"}
if "e" not in letters:
  print(1)
else:
  print(2)

# >>> 1

nums = {1, 2, 1, 3, 1, 4, 5, 6}
print(nums)
nums.add(-7)
nums.remove(3)
print(nums)

# >>> {1, 2, 3, 4, 5, 6}
# >>> {1, 2, 4, 5, 6, -7}

'''
Basic uses of sets include membership testing and the elimination of duplicate entries.
'''

# Fill in the blanks to create a set, add the letter "z" to it, and print its length.

nums = { "a", "b", "c", "d"}
nums.add("z")
print(len(nums))

# Sets can be combined using mathematical operations.

first = {1, 2, 3, 4, 5, 6}
second = {4, 5, 6, 7, 8, 9}

print(first | second)
print(first & second)
print(first - second)
print(second - first)
print(first ^ second)

# >>> {1, 2, 3, 4, 5, 6, 7, 8, 9}
# >>> {4, 5, 6}
# >>> {1, 2, 3}
# >>> {8, 9, 7}
# >>> {1, 2, 3, 7, 8, 9}


# What is the output of this code?
a = {1, 2, 3}
b = {0, 3, 4, 5}
print(a & b)

# >>> {3}

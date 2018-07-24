
# String Operations
'''Strings are bits of text either defined with 'single' or "double" quotations. Python has a number of build in methods which perform a variety of operations on strings.

First we'll declare a string for method testing purposes:'''

str = 'operations'
'''The method len prints the length of a string:'''

print(len(str))
# 10
'''The index method returns the location of the first occurence of a specified character:'''

print(str.index("r"))
# 3
# The count method returns the number of occurrences of a specified character:

print(str.count("o"))
# 2
# The following examples prints a slice of a string. It starts at index 2 and finishes at index 7, hence making it easier to do maths inside brackets.

print(str[2:8])
# eratio
# To split a string into two or more strings use the split method as follows:

str = 'string operations'
words = str.split(" ")
print(words)
# ['string', 'operations']

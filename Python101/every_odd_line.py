# Open file in read mode
inputFile = open(input('path to file: '), 'r')

# open other file in write mode
outputFile = open('output.txt', 'w')

# read the content of the file line by line
content = inputFile.readlines()
type(content)
for i in range(0, len(content)):
    if (i % 2 != 0):
        outputFile.write(content[i])
    else:
        pass

# close the file
outputFile.close()


# open file in read mode
outputFile = open('output.txt', 'r')

# read the content of the file
content1 = outputFile.read()

# print the content of the file
print(content1)

# close all files
inputFile.close()
outputFile.close()

'''
© https://www.geeksforgeeks.org/python-program-to-copy-odd-lines-of-one-file-to-other/
® https://stackoverflow.com/questions/33404261/how-to-get-python-to-write-every-other-line-in-a-text-file
'''

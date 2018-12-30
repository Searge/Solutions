genome = input()
count = 0

for nucleotide in genome:
    if nucleotide == 'C':
        count += 1

print(count)

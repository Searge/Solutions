exec("print(-15<x<=12 or 14<x<17 or x>=19)", {'x':int(input())})

exec("print( -15<{0}<=12 or 14<{0}<17 or {0}>=19 )".format(int(input())))


print(-15< int(input()) not in[13,14,17,18])

n = int(input())
# n in (−15,12]∪(14,17)∪[19,+∞)
print( (n in range(-14, 13)) or (n in range(15, 17)) or (n >= 19) )


if (
    (x > -15) and (x <= 12) or
    (x > 14) and (x < 17) or
    (x >= 19)
   ):
    print("True")
else:
    print("False")

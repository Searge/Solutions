a,b,c = (int(input()) for _ in range(3))

if c>=a>b:
    print(c,b, a, sep="\n")
elif a>=b>c:
    print(a,c, b, sep="\n")
elif b>=c>a:
    print(b,a, c, sep="\n")
elif a>=c>b:
    print(a,b, c, sep="\n")
elif c>=b>a:
    print(c,a, b, sep="\n")
elif b>=a>c:
    print(b,c, a, sep="\n")
elif a<=b<c:
    print(c,a, b, sep="\n")
elif a>b>=c:
    print(a,b, c, sep="\n")
elif a<b>c:
    print(b,a, c, sep="\n")
else:
    print(a,b,c, sep="\n")

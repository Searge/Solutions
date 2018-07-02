exec("exec(\"print((((a+b+c)*(-a+b+c)*(a-b+c)*(a+b-c))**0.5)/4)\", {C:int(input()) for C in ('a','b','c')})")


exec("""
a, b, c = [int(input()) for _ in "012"]
print(0.25 * ((a + b + c) * (a + b - c) * (a - b + c) * (-a + b + c)) ** 0.5)
""")

exec("print((((a+b+c)*(-a+b+c)*(a-b+c)*(a+b-c))**0.5)/4)", {C:int(input()) for C in ('a','b','c')})

exec("print(a**b)",{c:int(input()) for c in ('a','b')})

a,b,c=int(input()),int(input()),int(input())
print((((a+b+c)/2)*((b+c-a)/2)*((a-b+c)/2)*((a+b-c)/2))**0.5)

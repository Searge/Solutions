import sys


def дурний_жарт_про_вік():
    print('Скільки тобі років?')
    вік = int(sys.stdin.readline())
    if вік >= 10 and вік <= 13:
        print('Скільки буде 13 + 49 + 84 + 155 + 97')
        print('Багато!')
    else:
        print('Що?')

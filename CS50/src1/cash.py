def cash():
    change = ''
    while change is not int:
        try:
            change = int(float(input('Change: ')) * 100)
            break
        except ValueError:
            print('Please enter a valid number: ')

    quarters = change // 25
    dimes = (change % 25) // 10
    nickles = (change % 25 % 10) // 5
    pennies = (change % 5) // 1

    total = quarters + dimes + nickles + pennies
    print(total)


cash()

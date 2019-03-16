def cash():
    while True:
        try:
            change = int(float(input('Change: ')) * 100)
            if change <= 0:
                raise Exception()
            break
        except ValueError:
            print('Please enter a valid number: ')
        except Exception:
            print('Please enter a positive real number')

    quarters = change // 25
    dimes = (change % 25) // 10
    nickles = (change % 25 % 10) // 5
    pennies = (change % 5) // 1

    total = quarters + dimes + nickles + pennies
    print(total)


cash()

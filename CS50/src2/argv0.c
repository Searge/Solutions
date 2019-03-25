// Printing a command-line argument

#include <cs50.h>
#include <stdio.h>

int main(int argc, string argv[])
	// argv – вектор аргументів (з іст. причин)
	// масив аргументів, бо в кв.дужках []
	// argc — argument count
	// тобто, як багато рядків (передано аргументів) в argv
{
    if (argc == 2)
    {
        printf("hello, %s\n", argv[1]);
    }
    else
    {
        printf("hello, world\n");
    }
}

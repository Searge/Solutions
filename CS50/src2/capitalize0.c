// Capitalizes a string

#include <cs50.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
    string s = get_string("Before: ");
    printf("After:  ");
    for (int i = 0, n = strlen(s); i < n; i++)
    {
        // перевіряємо, чи літери малі
        // *лежать в діапазоні
        if (s[i] >= 'a' && s[i] <= 'z')
        {
            // віднімаємо різницю* між малою та
            // великою літерою
            // * i - 32
            printf("%c", s[i] - ('a' - 'A'));
        }
        else
        {
            printf("%c", s[i]);
        }
    }
    printf("\n");
}

// Prints string char by char, one per line

#include <cs50.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
    string s = get_string("Input: ");
    printf("Output:\n");
    for (int i = 0, n = strlen(s); i < n; i++)
    	// Ініціалізуємо ще одну змінну
    	// щоб не викликати щоразу ф-цію
    	// strlen
    {
        printf("%c\n", s[i]);
    }
}

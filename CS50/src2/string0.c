// Prints string char by char

#include <cs50.h>
#include <stdio.h>
#include <string.h> // для роботи з рядками

int main(void)
{
    string s = get_string("Input:  ");
    printf("Output: ");
    // ітеруємось по рядкові
    for (int i = 0; i < strlen(s); i++)
    	// string length
    {
        printf("%c\n", s[i]); // і в масиві літер
    }
}

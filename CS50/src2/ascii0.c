// Explicitly casts chars to ints

#include <cs50.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
    string s = get_string("String: ");
    for (int i = 0; i < strlen(s); i++)
    {
    	// ЯВНЕ ПЕРЕТВОЕННЯ ТИПІВ
        int c = (int) s[i];
        // виконуємо (кастинг), перетворення типів
        // в дужках вказуємо, що хочемо отримати
        // число, а не символ
        printf("%c %i\n", s[i], c);
    }
}

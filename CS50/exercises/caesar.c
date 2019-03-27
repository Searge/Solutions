#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>


int main(int argc, string argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }
    
    char* p = argv[1];
    while (*p != '\0')
    {
        if (*p<'0' || *p>'9')
        {
            printf("Usage: ./caesar key\n");
            return 0;
        }
        p++;
    }
    
    const int k = atoi(argv[1]);
    // prompt user for a code to encrypt
    string message = get_string("plaintext:  ");
    printf("ciphertext: ");

    for (int i = 0, n = strlen(message); i < n; i++)
    {
        if (isupper(message[i]))
        {
        // Get modulo number and add to appropriate case
             printf("%c", ((message[i] + k) - 65) % 26 + 65);
        }
        else if (islower(message[i]))
        {
            printf("%c", ((message[i] + k) - 97) % 26 + 97);
        }
        else
        {
            // return unchanged
            printf("%c", message[i]);
        }
    }
    printf("\n");
}

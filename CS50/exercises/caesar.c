#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
// #include <stdlib.h>

int key;
int input_length = 0;
int Z = 90;
int a = 97;
int z = 122;
int cipher = 0;

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
    
    key = (int) argv[1];

    // prompt user for a code to encrypt
    string message = get_string("plaintext:  ");
    printf("ciphertext: ");
    input_length = strlen(message);

    for (int i = 0; i < input_length; i++)
    {
        cipher = message[i] + key;
        if (!isalpha(message[i]))
        {
        	printf("%c", message[i]);
        }
        
        if (a > cipher > Z || cipher > z)
        {
            printf("%c", cipher - 26);
        }
        else
        {
            printf("%c", cipher);
        }
        cipher = 0;
    }
    printf("\n");
}

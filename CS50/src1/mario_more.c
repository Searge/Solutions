#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int h; 
    do
    {
    	h = get_int("Height: ");
    }
    while (h <= 0 || h > 8);
    for (int step = 0; step < h; step++)
    {
        for (int space = h - step; space > 1; space--)
        {
            printf("  ");
        }
        for (int hash = 0; hash < step + 1; hash++)
        {
            printf("#");
        }
        printf(" ");
        for (int hash = 0; hash < step + 1; hash++)
        {
            printf("#");
        }
        printf("\n");
    }

}

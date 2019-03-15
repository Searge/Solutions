#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int h; 
    do
    {
    	h = get_int("Height: ");
    }
    while (h <= 0 || h > 23);
    for (int step = 0; step < h; step++)
    {
        for (int space = h - step; space > 1; space--)
        {
            printf(" ");
        }
        for (int hash = 0; hash < step + 1; hash++)
        {
            printf("#");
        }
        printf("\n");
    }
}

// Спитати висоту піраміди; додати висоту в `n`
// пробіли `p` = `n`
// Поки сходинок `i` 0 і поки їх менше за `n`; збільшувати:
// 	Поки хешів `c` 0 і поки їх менше за `n`; збільшувати:
// 		Надрукувати `n` пробілів та `c` хешів
// 		p -= 1
// 	Перейти на наступний рядок




#include <stdio.h>
#include <math.h>
#include <cs50.h>

int main(void)
{
long card;
long left;
long c;                                        
long amex=10000000000000;         //
long visa1=1000000000000000;      //values used for vision later in the conditions
long visa2=1000000000000;         //
long mastercard=100000000000000;  //
int sum1=0;
int sum2=0;
int counter;



    do
    {
        card = get_long("Card number: ");
    }
    while (card < 0);

    left = card;                         //card number assigned to new ll that will be used in while loops
    c = card;                            //card number used in counter

//PART 1 - SUMS

    while (left > 0)
    {
        int x = 2 * ((left % 100) / 10); //every other digit multiplied by two, marked as x
        int y = ((left % 100) % 10);     //all other digits, marked as y

            if (x>9)                     //corrects numbers equal or greater than 10 accordingly
            {
                sum1=sum1 + x%10 + 1;
            }
            else
            {
                sum1 = sum1 + x;         //at this point, all xs are added together, stored in sum1
            }

            sum2 = sum2 + y;             //sum of all other digits, stored under sum2

        left = left/100;                 //removing last two digits to move further in loop
    }

//PART 2 = NUMBER OF DIGITS

    for (counter=0; c>0; counter++)      //counter of digits
    {
        c = c/10;
    }

    int sum = sum1 + sum2; 
    //sum of both previous sums which should end with 0 for a valid card, used in conditions below 


//PART 3 = CONDITIONS

    if (counter==15 && (sum%10)==0 && (card/(amex)==34 || card/(amex)==37))                                                 //conditions for amex
    {
        printf("AMEX\n");
    }

    else if (counter==16 && (sum%10)==0 && (card/mastercard>50 && card/mastercard<56))                                      //conditions for mastercard
    {
        printf ("MASTERCARD\n");
    }

    else if ((counter==16 && (sum%10)==0 && (card/visa1)==4) || (counter==13 && (sum%10)==0 && (card/visa2)==4))            //two possible conditions for visa
    {
        printf("VISA\n");
    }

    else
    {
        printf ("INVALID\n");                                                                                               //everything else
    }

}
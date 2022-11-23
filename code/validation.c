#include <stdio.h>
#include <math.h>

extern double calculation(double n);

void validation(double number) {
    if (number <= 0.0000000001) {
        printf("%s\n", "Incorrect data. Try again.");
    } else {
        printf("%s\n", "Correct data. Your answer is...");
        calculation(number);
    }
}

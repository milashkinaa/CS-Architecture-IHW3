#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

extern void validation(double n);

void console() {
    FILE *file;
    file = fopen("input.txt", "w");
    printf("%s\n", "Enter the number...");
    double a;
    scanf("%lf", &a);
    fprintf(file,"%lf", a);
    fclose(file);
    validation(a);
}

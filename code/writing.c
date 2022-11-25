#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

extern void validation(double n);

void writing() {
    srand(time(NULL));
    FILE *file;
    file = fopen("input.txt", "w");
    double a = rand();
    fprintf(file,"%lf", a);
    fclose(file);
    printf("%s\n", "Generated number is...");
    printf("%lf\n", a);
    validation(a);
}

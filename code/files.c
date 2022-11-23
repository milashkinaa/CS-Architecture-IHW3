#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

extern void validation(double n);

void files() {
    FILE *file;
    file = fopen("input.txt", "r");
    double a;
    fscanf(file,"%lf", &a);
    fclose(file);
    validation(a);
}

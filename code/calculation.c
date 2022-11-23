#include <stdio.h>
#include <math.h>
#include <time.h>
#include <unistd.h>

extern double formula(double n, double a);
extern void ending();

double calculation(double a) {
    double time_spent = 0.0;
    clock_t begin = clock();
    double e = 0.0000000001;
    double root = 0;
    double n = 1.0;
    while((fabs(formula(n, a) - n)) >= e) {
        root = formula(n, a);
        n = root;
    }
    FILE *out;
    out = fopen("output.txt", "w");
    fprintf(out, "%lf", n);
    printf("%lf\n", n);
    sleep(3);
    clock_t end = clock();
    time_spent += (double)(end - begin) / CLOCKS_PER_SEC;
    printf("The elapsed time is %f seconds", time_spent);
}

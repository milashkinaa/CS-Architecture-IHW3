#include <stdio.h>
#include <math.h>
 
extern void files();
extern void writing();
extern void console();

int main(int argc, char** argv) {
    if (argc == 2) {
        printf("%s\n", "If you want to scan a value from a file, press 1");
        printf("%s\n", "If you want to work with a random number, press 2");
        printf("%s\n", "If you want to enter a value from the console, press 3");
        int a;
        scanf("%d", &a);
        if (a == 1) {
            files();
        } else if (a == 2) {
            writing();
        } else if (a == 3) {
            console();
        } else {
            printf("%s\n", "You have entered an invalid value. Restart the program.");
        }
    } else {                 
        return 1;
    }
}

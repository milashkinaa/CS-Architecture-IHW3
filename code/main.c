#include <stdio.h>
#include <math.h>
 
extern void files();
extern void writing();
extern void console();

int main(int argc, char** argv) {
    FILE *file;
    file = fopen("input.txt", "r");
    
    char* arg;
    
    if (argc == 2) {
        if (argv[1] == "r") {
            writing();
        } else if (argv[1] == "f") {
            files();
        } else if (argv[1] == "c") {
            console();
        }
    } else {                 
        return 1;
    }
}

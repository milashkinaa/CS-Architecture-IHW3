#include <stdio.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <sys/time.h>

struct timeval tv1,tv2,dtv;
struct timezone tz;
void time_start() { gettimeofday(&tv1, &tz); }
long time_stop()
{ gettimeofday(&tv2, &tz);
  dtv.tv_sec= tv2.tv_sec -tv1.tv_sec;
  dtv.tv_usec=tv2.tv_usec-tv1.tv_usec;
  if(dtv.tv_usec<0) { dtv.tv_sec--; dtv.tv_usec+=1000000; }
  return dtv.tv_sec*1000+dtv.tv_usec/1000;
}

extern void sort(char* str);
extern void delete_repeats(char* str);
extern int equals(char* a, char elem);
extern void common_elements(char* a, char* b);
extern void writing();
extern void files();
extern void console();

int main(int argc, char** argv) {
    FILE *file1, *file2;
    file1 = fopen("input1.txt", "r");
    file2 = fopen("input2.txt", "r");

    time_start();

    char* arg[1];
    scanf("%d", arg);
    if (arg[0] == 1) {
            writing();
        } else if (arg[0] == 2) {
            files();
        } else if (arg[0] == 3) {
            console();
        }
    else {
        return 0;
    }

    char str1[10000];
    char str2[10000];
    fgets(str1, 10000, file1);
    fgets(str2, 10000, file2);
    sort(str1);
    delete_repeats(str1);
    sort(str2);
    delete_repeats(str2);
    common_elements(str1, str2);
    
    printf("\nTime: %ld \n", time_stop());

    return 0;
}

#include <stdio.h>

exec sql include sqlca;

int main() {
    exec sql begin declare section;
        int some_int = 0;
        int val = -1;
    exec sql end declare section;

    printf("%d\n", some_int);

    some_int = 1;
    
    printf("%d\n", some_int);
    exec sql select id into :val from student where id = :some_int;
}
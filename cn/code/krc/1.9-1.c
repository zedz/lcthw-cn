#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

#define MAXLINE 10 // in the book this is 1000

void copy(char to[], char from[])
{
    int i;

    i = 0;
    while((to[i] = from[i]) != '\0')
        ++i;
}

int main(int argc, char *argv[])
{
    int i;

    // use heap memory as many modern systems do
    char *line = malloc(MAXLINE);
    char *longest = malloc(MAXLINE);

    assert(line != NULL && longest != NULL && "memory error");

    // initialize it but make a classic "off by one" error
    for(i = 0; i < MAXLINE; i++) {
        line[i] = 'a';
    }

    // cause the defect
    copy(longest, line);

    free(line);
    free(longest);

    return 0;
}


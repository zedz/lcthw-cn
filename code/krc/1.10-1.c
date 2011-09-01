#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

#define MAXLINE 10 // in the book this is 1000

char *line;
char *longest;

void copy(void)
{
    int i;
    extern char *line, *longest;

    i = 0;

    while((longest[i] = line[i]) != '\0') ++i;
}

int main(int argc, char *argv[])
{
    int i;

    // use heap memory as many modern systems do
    line = malloc(MAXLINE);
    longest = malloc(MAXLINE);
    assert(line != NULL && longest != NULL && "memory error");

    // initialize it but make a classic "off by one" error
    for(i = 0; i < MAXLINE; i++) {
        line[i] = 'a';
    }

    // cause the defect
    copy();

    free(line);
    free(longest);

    return 0;
}


/* bad use of while loop with compound if-statement */
while ((len = getline(line, MAXLINE)) > 0)
    if (len > max) {
        max = len;
        copy(longest, line);
    }
if (max > 0) /* there was a line */
    printf("%s", longest);


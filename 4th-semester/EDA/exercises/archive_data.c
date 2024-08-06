#include <stdio.h>

int main() {

    FILE *fp;
    char ch;

    int num_char = 0, num_spaces = 0, num_tabs = 0, num_newlines = 0;

    fp = fopen("data.txt","r");

    if (fp != NULL) {
        while (1) {
            ch = fgetc(fp);
            num_char++;
            if (ch == ' ') {
                num_spaces++;
            }
            if (ch == '\t') {
                num_tabs++;
            }
            if (ch == '\n') {
                num_newlines++;
            }
            if (ch == EOF) {
                break;
            } 
        }
    } else {
        printf("Archive not opened.");
    }

    printf("# of characters: %d\n", num_char);
    printf("# of spaces: %d\n", num_spaces);
    printf("# of tabs: %d\n", num_tabs);
    printf("# of newlines: %d\n", num_newlines);

    return 0;
}
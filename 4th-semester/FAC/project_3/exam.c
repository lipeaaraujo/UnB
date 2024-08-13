// Project 3 exam implementation in C.

#include <stdio.h>
#include <stdlib.h>

int main() {

    int num_questions, num_correct = 0;

    scanf("%d", &num_questions);

    char *answer_sheet = (char *) calloc(num_questions+1, sizeof(char));
    char *answers = (char *) calloc(num_questions+1, sizeof(char));

    scanf("%s", answer_sheet);
    scanf("%s", answers);

    for (int i=0; i < num_questions; i++) {
        if (answers[i] == answer_sheet[i]) {
            num_correct++;
        }
    }

    printf("%d", num_correct);

    return 0;
}
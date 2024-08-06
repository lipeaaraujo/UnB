#include <stdio.h>
#include <string.h>

int word2vec(char *name_base_file) {
    
    FILE *base_file, *new_file;
    char* buffer;
    char name_new_arq[20];
    char new_word[20];
    char check_word[20];
    int word_index = 0;
    char c;

    // Creating the output file name.
    buffer = strtok(name_base_file, ".");
    strcpy(name_new_arq, buffer);

    strcat(name_new_arq, "_Vocabulo");
    strcat(name_new_arq, ".txt");
    printf("%s\n", name_new_arq);
    printf("%s\n", name_base_file);

    // StopWord treatment.
    base_file = fopen(name_base_file, "r");
    new_file = fopen(name_new_arq, "w+");

    if (new_file == NULL) printf("new");
    if (base_file == NULL) printf("base");

    if (base_file == NULL || new_file == NULL) {
        return 0;
    } else {
        while (1) {
            c = fgetc(base_file);

            if ((c >= 97 && c <= 122)) {
                // Lower case.
                if (c >= 65 && c <= 90) c += 32;
                new_word[word_index] = c;
                word_index++;
            } else if (c >= 65 && c <= 90) {
                // Upper case.
                c += 32;
                new_word[word_index] = c;
                word_index++;
            } else if (c == ' ' || c == '\n' || c == '\t' || c == 13) {
                // End of a word.
                new_word[word_index] = '\0';

                if (strlen(new_word) > 3) {
                    // Save it in the vocabulary file.
                    fseek(new_file, 0, SEEK_SET);

                    while (1) {
                        if (fscanf(new_file, "%s", check_word) == EOF) {
                            strcat(new_word, "\n");
                            fseek(new_file, 0, SEEK_END);
                            fprintf(new_file, new_word);
                            break;
                        }
                        if (strcmp(new_word, check_word) == 0) {
                            break;
                        }
                    }
                }

                strcpy(new_word, ""); // Clear the word.4
                word_index = 0;

            } else if (c == EOF) {
                fclose(base_file);
                fclose(new_file);
                break;
            }
        }
    }

    return 1;
}

int main () {
    char file_name[50];

    scanf("%s", file_name);
    if (!word2vec(file_name)) {
        printf("The tokenization failed!");
    }

    return 0;
}
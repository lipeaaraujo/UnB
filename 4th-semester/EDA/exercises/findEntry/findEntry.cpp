#include <iostream>
using namespace std;

bool formatCSV(char* fileName) {
    // Formats a CSV file and generates a new formated text file.

    FILE *file, *formattedFile;

    file = fopen(fileName, "r");
    formattedFile = fopen("formatted_file.txt", "w+");

    if (!file || !formattedFile) {
        cout << "Couldn't format file.\n";
        return false;
    } else {
        
    }
}

int main() {



    return 0;
}
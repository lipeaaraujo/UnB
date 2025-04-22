#include <iostream>
#include <time.h>
#include <cstdlib>
using namespace std;

// Esta função rearranja o vetor v[0..n-1] em ordem crescente.
//Ref.: https://www.ime.usp.br/~pf/algoritmos/aulas/ordena.html

int insercao(int n, int v[])
{
    int count = 0;

    for (int j = 1; j < n; ++j) {
        int x = v[j];
        int i;
        for (i = j-1; i >= 0 && v[i] > x; --i) {
            v[i+1] = v[i]; // COMANDO A SER CONTABILIZADO
            count++;
        }
        v[i+1] = x;
    }

    return count;
}

// Bubble sort algorithm.
// Ref.: https://github.com/kayelserafim/bubble-sort-mpi/blob/main/src/parallel_master.c

int bs(int n, int *vetor) {
	int c = 0, d, troca, trocou = 1, count = 0;
	while ((c < (n - 1)) & trocou) {
		trocou = 0;
		for (d = 0; d < n - c - 1; d++)
			if (vetor[d] > vetor[d + 1]) { // COMANDO A SER CONTABILIZADO
				troca = vetor[d];
				vetor[d] = vetor[d + 1];
				vetor[d + 1] = troca;
				trocou = 1;
                count++;
			}
		c++;
	}

    return count;
}

void fillRandom(int size, int arr[]) {
    // Fills a int array with random values.
    srand(time(NULL));

    for (int i=0; i < size; i++) {
        arr[i] = ((float) rand()) / ((float) RAND_MAX) * size;
    }
}

void showMenu() {
    cout << "Complexity Laboratory" << endl;
    cout << "T - Read archives" << endl;
    cout << "R - Analyse data" << endl;
    cout << "S - Leave" << endl;
}

char getOption() {
    char option;

    cout << "Option: ";
    cin >> option;

    if (option >= 65 && option <= 90) {
        option += 32;
    }

    cin.clear();
    cin.ignore();

    return option;
}

void readData() {
    FILE *file = fopen("files/testes.txt", "r");

    if (file) {
        cout << "File open!" << endl;

        FILE *dataFile = fopen("esforcocomputacional.txt", "w+");
        int sizeArr, bscount, iscount;
        float eB, eI;

        while (!feof(file)) {
            fscanf(file, "%d", &sizeArr);
            int *arr = new int[sizeArr]; 

            fillRandom(sizeArr, arr);
            int *copyArr = new int[sizeArr];
            copy(arr, arr+(sizeArr-1), copyArr);

            bscount = bs(sizeArr, arr);
            iscount = insercao(sizeArr, copyArr);

            fprintf(dataFile, "%d %d %d\n", sizeArr, bscount, iscount);

            delete[] arr;
            delete[] copyArr;
        }

        fclose(file);
        fclose(dataFile);
    } else {
        cout << "Failed to open file!" << endl;
    }
}

void analyseData() {
    // Analyses the data inside the data file and returns info about it.
    FILE *dataFile = fopen("esforcocomputacional.txt", "r");

    if (!dataFile) {
        cout << "Failed to open data file!" << endl;
    } else {
        cout << "File open!" << endl;

        // Data to be obtained.
        int biggestBS, smallestBS, averageBS, biggestI, smallestI, averageI;

        // Read the first line of the file.
        int sizeArr, bscount, iscount, sumBs = 0, sumIs = 0, counter = 1;
        fscanf(dataFile, "%d %d %d\n", &sizeArr, &smallestBS, &smallestI);

        // Read the file, and obtain the data.
        while(!feof(dataFile)) {
            fscanf(dataFile, "%d %d %d\n", &sizeArr, &bscount, &iscount);

            if (bscount > biggestBS) {
                biggestBS = bscount;
            } else if (bscount < smallestBS) {
                smallestBS = bscount;
            }

            sumBs += bscount;

            if (iscount > biggestI) {
                biggestI = iscount;
            } else if (iscount < smallestI) {
                smallestI = iscount;
            }

            sumIs += iscount;

            counter += 1;
        }

        averageBS = sumBs / counter;
        averageI = sumIs / counter;

        cout << "eB Data: " << endl;
    }
}

// Main program.
int main() {

    bool running = true;
    char option;

    do {
        showMenu();
        option = getOption();

        switch (option) {
            case 't':
                system("clear");
                readData();
            break;
            case 'r':
                system("clear");
            break;
            case 's':
                cout << "Exiting..." << endl;
                running = false;
            break;
            default:
                system("clear");
                cout << "Invalid option!" << endl;
            break;
        }
    } while (running == true);

    return 0;
}
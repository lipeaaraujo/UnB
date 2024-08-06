#include <iostream>
using namespace std;

// Soma de todos os elementos de um vetor.
long int somavet(int *a, int qtde) {
    if (qtde <= 1) {
        return a[0];
    } else {
        return a[qtde-1] + somavet(a, qtde-1);
    }
}

// Verifica se duas strings são iguais.
bool areStringsEqual(string s1, string s2) {
    if (s1.empty() and s2.empty()) {
        return true;
    } else if ((s1.empty() and !s2.empty()) or (!s1.empty() and s2.empty())){
        return false;
    } else if (s1[0] == s2[0]) {
        return areStringsEqual(&s1[1],&s2[1]);
    } else {
        return false;
    }
}

// Calcula o n-ésimo termo da sequência de Fibonacci.
int nthFibonacci(int n) {
    if (n <= 0) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else {
        return nthFibonacci(n-1) + nthFibonacci(n-2);
    }
}

int main() {

    int a[] = {5,5,3,4,6,5,10};
    int qtde = sizeof(a)/sizeof(a[0]);

    cout << somavet(a, qtde) << endl;

    string s1 = "testi";
    string s2 = "teste";

    cout << areStringsEqual(s1, s2) << endl;

    int n = 10;

    cout << nthFibonacci(n) << endl;

    return 0;
}
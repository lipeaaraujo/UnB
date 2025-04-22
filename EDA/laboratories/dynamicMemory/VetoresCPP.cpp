#include <iostream>
using namespace std;

int* CriaVetInt(int qntdElementos) {
    // Cria um vetor de inteiros com a quantidade de elementos recebida.
    int* vetor = new int[qntdElementos];
    return vetor;
}

float* CriaVetFloat(int qntdElementos) {
    // Cria um vetor de floats com a quantidade de elementos recebida.
    float* vetor = new float[qntdElementos];
    return vetor;
}

void AppendChar(char carac, char* pvetcar, int ptammax, int pqntd) {
    // Adiciona um caracter na primeira posição disponível do vetor.
    if (pqntd < ptammax) {
        for (int i=0; i < ptammax; i++) {
            if (pvetcar[i] == 0) {
                pvetcar[i] = carac;
                break;
            }
        }
    }
}

void RemoveChar(char carac, char* pvetcar, int ptammax, int pqntd) {
    // Remove um caracter do vetor e o reorganiza.
    for (int i=0; i < ptammax; i++) {
        if (pvetcar[i] == carac) {
            // Reordene os elementos.
            for (int j=i; j < pqntd-1; j++) {
                pvetcar[j] = pvetcar[j+1];
            }
            pvetcar[pqntd-1] = 0;
        }
    }
}

bool IncluirVetorOrdenado(double* pvalores, double pv, int pcapacidade, int ptamanho) {
    // Verifica se o vetor já está preenchido
    if (ptamanho >= pcapacidade) {
        return false; // Não é possível inserir mais elementos.
    }

    // Procurando a posição correta no vetor.
    int posInsercao = 0;
    while (posInsercao < ptamanho && pvalores[posInsercao] < pv) {
        posInsercao++;
    }

    // Move todos os valores para direita para abrir espaço.
    for (int i = ptamanho-1; i >= posInsercao; i--) {
        pvalores[i+1] = pvalores[i];
    }

    // Inclui o novo valor.
    pvalores[posInsercao] = pv;

    return true;
}

bool ExcluirVetorOrdenado(double* pvalores, double pv, int pcapacidade, int ptamanho) {
    // Itere pelo vetor procurando o valor.
    int posExclusao = 0;
    while (posExclusao < ptamanho && pvalores[posExclusao] != pv) {
        posExclusao++;
    }

    if (posExclusao == ptamanho) {
        return false; // O valor não está no vetor.
    }

    // Mova todos os elementos para a esquerda.
    for (int i = posExclusao; i < ptamanho-1; i++) {
        pvalores[i] = pvalores[i+1];
    }
    pvalores[ptamanho-1] = 0; // Esvazie o último valor.
    
    return true;
}

bool EIgual(int* pveta, int* pvetb, int ptama, int ptamb) {
    // Veja se os dois vetores são do mesmo tamanho.
    if (ptama != ptamb) {
        return false;
    }

    // Itere pelos dois vetores e compare os elementos.
    for (int i = 0; i < ptama; i++) {
        if (pveta[i] != pvetb[i]) {
            return false; // Os vetores não são iguais.
        }
    }

    return true;
}

void Algoritmo() {
    int n, numMenorDem = 0;
    double S = 0;
    int* v = NULL;

    cout << "Insira o número de elementos: ";
    cin >> n;

    v = new int[n];

    for (int i = 1; i <= n; i++) {
        cout << "Elemento #" << i << ": ";
        cin >> v[i];
    }

    for (int i = 1; i <= n; i++) {
        S += ((float) i)/((float) v[i]);
        if (i < v[i]) {
            numMenorDem++;
        }
    }

    cout << "Soma S: " << S << endl;
    cout << "Número de termos com numerador menor que o denominador: " << numMenorDem << endl;
}

int main() {
    // Função main, para testar funções.

    // 2.
    int* vetor = CriaVetInt(20);

    for (int i=0; i < 20; i++) {
        cout << vetor[i] << " ";
    }
    cout << "\n";

    // 3.
    char* vetorChar = new char[10];
    AppendChar('a', vetorChar, 10, 0);
    AppendChar('b', vetorChar, 10, 1);
    AppendChar('c', vetorChar, 10, 2);
    RemoveChar('b', vetorChar, 10, 3);

    for (int i=0; i < 10; i++) {
        cout << vetorChar[i] << " ";
    }
    cout << "\n";

    // 4 e 5.
    double* vetorDouble = new double[10];
    IncluirVetorOrdenado(vetorDouble, 2, 10, 0);
    IncluirVetorOrdenado(vetorDouble, 4.5, 10, 1);
    IncluirVetorOrdenado(vetorDouble, 3, 10, 2);
    ExcluirVetorOrdenado(vetorDouble, 2, 10, 3);   

    for (int i=0; i < 20; i++) {
        cout << vetorDouble[i] << " ";
    }
    cout << "\n";

    // 6.
    int vetorInt_a[] = {2, 5, 4, 6};
    int vetorInt_b[] = {2, 5, 4, 5};
    int tamVet_a = size(vetorInt_a);
    int tamVet_b = size(vetorInt_b);

    cout << EIgual(vetorInt_a, vetorInt_b, tamVet_a, tamVet_b) << "\n";

    // 7.
    Algoritmo();

    delete[] vetor, vetorChar, vetorDouble;

    return 0;
}
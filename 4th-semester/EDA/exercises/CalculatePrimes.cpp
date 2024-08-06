#include <iostream>
#include <cmath>
using namespace std;

bool isPrime(int n);

int main() {

    for (int i=3; i < 10000000; i+=2) {
        if (isPrime(i)) {
            cout << i << "\n";
        }
    }

}

bool isPrime(int n) {
    float root = sqrt(n);

    for (int i = 2; i <= root; i++) {
        if (n % i == 0) {
            return false;
        }
    }

    return true;
}
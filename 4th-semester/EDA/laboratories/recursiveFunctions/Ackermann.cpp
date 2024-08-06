#include <iostream>
#include <limits>
using namespace std;

int AckermannRecursivo(int m, int n) {
    if (m == 0) {
        return n+1;
    } else if (n == 0 && m > 0) {
        return AckermannRecursivo(m-1,1);
    } else {
        return AckermannRecursivo(m-1,AckermannRecursivo(m,n-1));
    }
}

int main() {
    int m, n;
    bool programRunning = true;

    do {
        cout << "Insert positive integer arguments for the Ackermann function\n";

        cout << "m: ";
        cin >> m;
        
        if (cin.fail() || m <= 0) {
            cout << "Invalid value, enter a valid integer value." << endl;
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            continue;
        }

        cout << "n: ";
        cin >> n;

        if (cin.fail() || n <= 0) {
            cout << "Invalid value, enter a valid integer value." << endl;
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
            continue;
        }
        
        cout << "Result: ";
        cout << AckermannRecursivo(m, n) << endl;
        programRunning = false;

    } while(programRunning);

    return 0;
}
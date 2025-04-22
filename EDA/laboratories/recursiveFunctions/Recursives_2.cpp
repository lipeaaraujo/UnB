#include <iostream>
using namespace std;

// Calculates the sum of the digits of a integer number.
int sumDigits(int num) {
    if ((num / 10) == 0) {
        return (num % 10);
    } else {
        return (num % 10) + sumDigits(num / 10);
    }
}

// Calculates the product of two integers recursively.
int recursiveProduct(int a, int b) {
    if (b <= 1) {
        return a;
    } else {
        return a + recursiveProduct(a, b-1);
    }
}

// Calculates x to the power of n, recursively.
int powerOf(int x, int n) {
    if (n <= 0) {
        return 1;
    } else {
        return x * powerOf(x, n-1);
    }
}

// Determines if a string is a palindrome recursively.
bool isPalindrome(string s, int start, int end) {
    if (start >= end) {
        return true;
    }

    if (s[start] != s[end]) {
        return false;
    }
    
    return isPalindrome(s, start+1, end-1);
}

// Calculates the maxCommonDivisor of 2 integers recursively.
int greatestCommonDivisor(int a, int b) {
    if (b == 0) {
        return a;
    } else {
        return greatestCommonDivisor(b, a % b);
    }
}

// Gets the  biggest element in a int array.
int biggestInt(int array[], int size) {
    if (size == 1) {
        return array[0];
    } else if (array[0] > array[1]) {
        array[1] = array[0];
        return biggestInt(&array[1], size-1);
    } else {
        return biggestInt(&array[1], size-1);
    }
}

// Gets the position of a element in the array.
int elementPosition(int array[], int element) {
    if (array[0] == element) {
        return 0;
    } else {
        return 1 + elementPosition(&array[1], element);
    }
}

int main() {

    cout << sumDigits(1000) << endl;
    cout << recursiveProduct(9, 9) << endl;
    cout << powerOf(2, 4) << endl;

    string s = "nanan";

    cout << isPalindrome(s, 0, s.size()-1) << endl;
    cout << greatestCommonDivisor(20,18) << endl;

    int array[5] = {1, 2, 5, 6, 2};

    cout << biggestInt(array, sizeof(array)/sizeof(array[0])) << endl;
    cout << elementPosition(array, 0) << endl;

    return 0;
}
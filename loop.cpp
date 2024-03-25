#include <iostream>
using namespace std;

int main ()  {
    int num;
    cout << "Enter a Starting Number: " ;
    cin >> num;

    while (num>0) {
        cout << num << "";
        --num;
    }
    return 0;
    }
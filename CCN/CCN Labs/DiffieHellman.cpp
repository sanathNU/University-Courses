#include <cmath>
#include <iostream>
using namespace std;

long long int power( long long int a, long long int b,long long int P)
{
    if (b ==1)
        return a;
    else
        return (((long long int)pow(a,b))%P);
}

// main prog
int main()
{
    long long int P, G, x, a, y,b, ka, kb;
    // the prime no
    P = 0x2a6d;
    cout << "The value of P is : "<<P << endl;
    // the primite root of p
    G = 0x2da;

    //alice no
    a = 0xf00d;
    cout << "The private key A for alice is: " << a <<endl;

    x = power(G,a,P);

    //bob no
    a =0xbabe;
    cout << "The privat key B for bob is: " << b<< endl;

    y = power(G,b,P);
    //Generation the secret key after exchange of public keys
    
    ka = power(y,a,P);
    kb = power(x,b,P);

    cout << "The secret key for alice is: "<< ka<< endl;
    cout << "The secret key for boy is: " <<kb <<endl;

    return 0;
}

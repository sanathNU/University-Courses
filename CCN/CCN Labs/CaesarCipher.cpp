#include <iostream>
#include <string>
using namespace std;

string SubEncrypt(string data, int key){
    string dataRet = data;
    for(int i=0; i<data.size();i++){
        dataRet[i] = ((((int)data[i])-1+key)%127)+1;
    }
    return dataRet;
}

string SubDecrypt(string data, int key){
    string dataRet = data;
    for(int i=0; i<data.size();i++){
        dataRet[i] = ((((int)data[i]+1)-1-key)%127)-1;
    }
    return dataRet;
}

int main(){
    string message;
    int key;

    cout << "Enter the main message to encrypt: \n";
    cin >> message;

    cout << "Enter the key for encryption: \n";
    cin >> key;
    
    string encrypted = SubEncrypt(message, key);
    cout << "The encrypted string is " << encrypted<< endl;

    string decrypted = SubDecrypt(encrypted,key);
    cout << "The decrypted message and the original data is "<< decrypted <<endl;
    return 0;
}
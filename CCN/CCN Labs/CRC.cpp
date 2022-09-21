#include <iostream>
#include <string>
using namespace std;

string XorStrings(string a, string b){
    int len = a.length();
    string xored;
    //looping over for xoring

    for(int j=0; j<len; j++)
        xored += (a[j]==b[j])?'0':'1';
    return xored;
}

int main(){
    string data, poly;
    cout <<"Enter the data: ";
    cin >> data;
    cout << "Enter the polynomial: ";
    cin >> poly;

    int polylen = poly.length();
    int datalen = data.length();

    string temp = data;
    for(int i=1;i<polylen; i++){
        temp+='0';
    }

    cout << temp <<endl;
    int idx = 0;
    string rem;
    string small = temp.substr(idx,polylen);

    while((idx+polylen)<=temp.length())
    {
        if(small[0]=='0'){
            cout << "Temp: "<< temp[idx+polylen] <<endl;
            small = small.substr(1,polylen-1) + temp[idx + polylen];
            idx++;

            continue;
        }
        rem = XorStrings(small,poly);

        small = rem.substr(1,polylen-1) + temp[idx+polylen];
        cout << "Reminder: " << small << " idx " << endl;
        idx++;
    }
    string finalans = data+small;
    cout << finalans << endl;

    return 0;
}
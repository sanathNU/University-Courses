#include <iostream>
#include <string>
using namespace std ;

//starting the main function
int main()
{
    char flag;
    char escape;
    cout<<"Enter the flag: ";
    cin>>flag;
    cout<<"Enter the escape: ";
    cin>>escape;

    string data="", stuffedstream="",framedstream="", deframedstream="", destuffedstream="";
    cout<<"Enter the data: ";
    cin>>data;
    int n=data.length();

    for(int i=0;i<n;i++)
    {
        if(data[i]==flag)
            stuffedstream+=escape;
        else if(data[i]==escape)
            stuffedstream+=escape;
        stuffedstream+=data[i];
    }
    cout<<"Stuffed stream: "<<stuffedstream<<endl;
    framedstream=flag+stuffedstream+flag;
    cout<<"Framed stream: "<<framedstream<<endl;
    deframedstream=framedstream.substr(1,stuffedstream.length());
    cout<<"Deframed stream: "<<deframedstream<<endl;
    for(int i=0;i<stuffedstream.length();i++)
    {
        if(deframedstream[i]==escape)
        {
        if(deframedstream[i+1]==escape)
        {
            //destuffedstream+=escape;
            i++;
    }
        else
        continue;
        }
        destuffedstream+=deframedstream[i];
    }
    cout<<"Destuffed Stream: "<<destuffedstream<<endl;
    return 0;
}
#include <iostream>
#include <string>
using namespace std;

string frame_data(string stream)
{
    //directly adding 01111110 to the end and starting of the frame
    string framed_data = "01111110" + stream + "01111110";
    return framed_data;
}
string deframe_data(string stream)
{
    return (stream.substr(8,stream.length()-16));
}
string BitStuff ( string stream)
{
    string stuffed_data;
    char bit, bit_last_seen = 0;
    unsigned  int counT = 0;
    for(int i = 0; i<stream.length(); i++){
        bit = stream[i];
        if(bit_last_seen == '1')
        {
            counT++;
        }
        else
        {
            counT = 0;
        }

        if(counT == 5)
        {
            stuffed_data +='0';
            counT= 0;
        }
        bit_last_seen = bit;
        stuffed_data +=bit;// adding the stream of data
    }
    return stuffed_data;
}

string BitDeStuff ( string stream)
{
    string destuffed_data;
    char bit,bit_last_seen = 0;
    unsigned int counT = 0;
    bool skip = false;

    for(int i=0; i<stream.length();i++){
        //if skip enabled skip this digit
        if(skip)
        {
            skip = false;
            continue;
        }
        //else add to the final stream
        bit = stream[i];
        if(bit_last_seen == '1')
        {
            counT++;
        }
        else{
            counT= 0;
        }
        bit_last_seen = bit;
        if(counT==5)
        {
            counT=0;
            continue;
        }
        destuffed_data += bit; //adding the valid bit
    }
    return destuffed_data;
}
int main()
{
    string data_stream;
    char bit;
    cout<<" data stream: ";
    while(cin.get(bit)&&(bit == '0' || bit == '1'))
    {
        data_stream += bit;
    }
    string stuffed_stream = BitStuff(data_stream);
    string framed_stream = frame_data(stuffed_stream);
    string deframed_stream = deframe_data(framed_stream);
    string destuffed_stream = BitDeStuff(deframed_stream);
    cout<<" stuffed stream: " << stuffed_stream << '\n';
    cout<<" framed stream: " << framed_stream << '\n';
    cout<<" deframed stream: " << deframed_stream << '\n';
    cout<<" destuffed_stream: " << destuffed_stream << '\n';
}
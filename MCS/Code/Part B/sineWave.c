// program to generate a sine wave
#include <reg51.h>
#include <math.h>

void delay(unsigned int x)
{
	for(;x>0; x--);
}

void main()
{
	unsigned char value[72];
	unsigned int i=0,q=0;
	unsigned char x;
	
	for(x=0 ; x<36; x++){
		value[x] = (128*sin(i*3.14/180)) +128;
		i+=5;
	}
	
	for(x=36 ; x<72; x++){
		value[x] = (128*sin(i*3.14/180)) +128;
		i+=5;
	}
	
	while(1){
		for(x=0;x<72;x++)
		{
			P0 = value[x];
			P1 = value[x];
			delay(5);
		}
	}
}
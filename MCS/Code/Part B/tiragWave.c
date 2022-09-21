// Program to generate Triangular wave
#include<reg51.h>

main()
{
	unsigned char i=0;
	P0 = 0x00;
	while(1){
		for(i=0;i<0xff;i++){
			P1 = i;
			P0 = i;
		}
		for(i=0xfe;i>0x00;i--){
			P0 = i;
			P1 = i;
		}
	}}
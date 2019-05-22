#include "firmware.h"

uint32_t soft_gcd_pcpi(uint32_t a, uint32_t b)
{
	uint32_t ans;
	//TODO: implement software version of GCD here!!!
	ans = 0;
	int c = 0;
	/*
	Do While a <> b 
     Do While a > b
         c = a – b 
         a = c
     Loop
     Do While b > a
         c = b – a 
         b = c 
     Loop
 Loop
	*/
	if(a == b)
		c = a;
	
	while( a>b || a<b ){
		while(a > b){
			c = a - b;
			a = c;
		}
		while(a < b){
			c = b - a;
			b = c;
		}
	}
	
	ans = c;
	
	return ans;	
}

void gcd_pcpi(void)
{
	int start, stop;
	uint32_t A, B;
	uint32_t soft_ans, hard_ans;
	A = 5;
	B = 5;
	print_str("GCD: A=");
	print_dec(A);
	print_str(" B=");
	print_dec(B);

	print_str("\nSoft ans:");
	start = tick();
	soft_ans = soft_gcd_pcpi(A, B);
	stop = tick();
	print_dec(soft_ans);
	print_str("\nElapsed: ");
	print_dec(stop - start);
	
	print_str("\nHard ans:");
	start = tick();
	//TODO: implement hardware version of GCD in gcd_pcpi.v!
	hard_ans = hard_gcd_pcpi(A, B);
	stop = tick();
	print_dec(hard_ans);
	print_str("\nElapsed: ");
	print_dec(stop - start);
}


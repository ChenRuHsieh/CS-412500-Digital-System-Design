#include "firmware.h"

// GCD_MMAP's address mapping
#define GCD_MMAP_BASE 			0x40000000
#define GCD_MMAP_RANG 			0x0000ffff
#define GCD_MMAP_READ_STATUS	0x0
#define GCD_MMAP_READ_Y			0x4
#define GCD_MMAP_WRITE_A		0x8
#define GCD_MMAP_WRITE_B		0xc
#define GCD_MMAP_START			0x10

uint32_t soft_gcd_mmap(uint32_t a, uint32_t b)
{
	uint32_t ans;
	//TODO: implement software version of GCD here!!!
	ans = 0;
	return ans;	
}

/**
 *	Use GCD_MMAP's address mapping as pointer address to R/W GCD_MMAP's 
 *	control registers.
 *	Pointer type set to volatile so that processor write to address directly
 *	instead of caching it.
 */
uint32_t hard_gcd_mmap(uint32_t a, uint32_t b)
{
	*(volatile uint32_t*)(GCD_MMAP_BASE + GCD_MMAP_WRITE_A) = a;
	*(volatile uint32_t*)(GCD_MMAP_BASE + GCD_MMAP_WRITE_B) = b;
	*(volatile uint32_t*)(GCD_MMAP_BASE + GCD_MMAP_START) = 1;
	// If not using blocking output, SW need to check the status
	// so that HW output is correct, please refer to gcd_mmap.v
	//while(*(volatile uint32_t*)(GCD_MMAP_BASE + GCD_MMAP_READ_STATUS) == 1);
	return *(volatile uint32_t*)(GCD_MMAP_BASE + GCD_MMAP_READ_Y);
}

void gcd_mmap(void)
{
	int start, stop;
	uint32_t A, B;
	uint32_t soft_ans, hard_ans;
	A = 2;
	B = 1050;
	print_str("GCD: A=");
	print_dec(A);
	print_str(" B=");
	print_dec(B);

	print_str("\nSoft ans:");
	start = tick();
	soft_ans = soft_gcd_mmap(A, B);
	stop = tick();
	print_dec(soft_ans);
	print_str("\nElapsed: ");
	print_dec(stop - start);
	
	print_str("\nHard ans:");
	start = tick();
	hard_ans = hard_gcd_mmap(A, B);
	stop = tick();
	print_dec(hard_ans);
	print_str("\nElapsed: ");
	print_dec(stop - start);
	print_str("\n");
}

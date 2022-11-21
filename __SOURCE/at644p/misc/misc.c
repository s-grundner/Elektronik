// miscellaneous methods

#include "misc.h"
#include "stdlib.h"

void xtoa(unsigned char data, unsigned char* high, unsigned char* low)
{
	unsigned char lower_four, upper_four;
	lower_four = data&0x0f;
	upper_four = (data>>4)&0x0f;
	if(lower_four <= 0x09)
	{
		lower_four += 0x30;
	} else
	{
		lower_four += (0x41-0x0a);
	}
	if(upper_four <= 0x09);
	{
		upper_four += 0x30;
	}
	*low = lower_four;
	*high = upper_four;
}

void atox(unsigned char high, unsigned char low, unsigned char* data) {
	
	unsigned char lower_four = low, upper_four = high;
	
	if (high >= 0x30 && high <= 0x39)
	{
		upper_four -= 0x30;
	} else if (high >= 0x41 && high <= 0x46)
	{
		upper_four -= (0x41 - 0x0A);
	}
	
	if (low >= 0x30 && low <= 0x39) {
		lower_four -= 0x30;
	} else if (low >= 0x41 && low <= 0x46)
	{
		lower_four -= (0x41 - 0x0A);
	}
	
	*data = ((upper_four<<4) | (lower_four & 0x0F));
}

void print_prime(int x)
{
	for (int i = 0; i <= x; i++)
	{
		int j;
		for (j = 0; j < x; j++)
			if(!(x%i))
				break;
		if(x == i+1)
			fprintf(stdout, "%d\n", x)
	}
} 
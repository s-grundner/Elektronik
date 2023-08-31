#include "stdhtl.h"

#ifndef DEBUG
// #include <util/delay>
#endif

void htl_delay_ms(unsigned int a_delay_ms)
{
#ifndef DEBUG
	volatile unsigned long counter;
	volatile unsigned int help;
	for ( counter = 0; counter < a_delay_ms * 150UL; counter++) help++;
#else
	_delay_ms(a_delay_ms);
#endif
}
void htl_delay_us(unsigned int a_delay_us)
{
	#ifndef DEBUG
	volatile unsigned long counter;
	volatile unsigned int help;
	for ( counter = 0; counter < a_delay_us; counter++) help++;
#else
	_delay_us(a_delay_us);
#endif
}
#include "htl_timer.h"

bool HTL_HW_Timer::htl_timer_init()
{
	uint8_t HTL_HW_Timer::_counter = 0;
	HTL_HW_Timer::htl_hw_timer_index_e HTL_HW_Timer::_hw_timer_index = HTL_HW_Timer::htl_hw_timer_index_e::TIMER2;

	htl_hw_timer_t* HTL_HW_Timer::_timer = NULL;

	uint16_t HTL_HW_Timer::_prescaler = 0;
	uint64_t HTL_HW_Timer::_overflow = 0;

	HTL_HW_Timer::htl_hw_timer_smphr = xSemaphoreCreateBinary();
	
	return 1;
}
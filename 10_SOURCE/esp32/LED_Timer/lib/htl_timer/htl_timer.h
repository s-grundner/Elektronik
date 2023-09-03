
#include "global.h"

/**
 * @brief this class configurates and runs a Hardware Timer
 * @class HW_Timer
 */
class HTL_HW_Timer
{
public:
	enum htl_hw_timer_index_e
	{
		TIMER2 = 2,
		TIMER3
	};
	struct htl_hw_timer_t
	{

	};

private:
	static const uint8_t f_clk = 80; // 80MHz
	static const bool RISING_EDGE = true;
	static const bool FALLING_EDGE = false;
	static const bool AUTORELOAD = true;
	static const bool COUNTER_UP = true;
	static const bool COUNTER_DOWN = false;

	static htl_hw_timer_t *_timer;
	static htl_hw_timer_index_e _hw_timer_index;
	static uint16_t _prescaler;
	static uint64_t _overflow;
	static uint8_t _counter;

	static SemaphoreHandle_t htl_hw_timer_smphr;

public:
	/**
	 * @brief initialize hardware timer
	 * 
	 * @param hw_timer_index index of the timer to be initialized
	 * @param prescaler used prescaler
	 * @param overflow overflow initialized to 1s
	 * @return suceeded 
	 */
	bool htl_timer_init(htl_hw_timer_index_e hw_timer_index = TIMER2, uint16_t prescaler = 80, uint64_t overflow =1000000);

	/**
	 * @brief starts the hardware timer
	 * 
	 */
	static void htl_timer_start(void);	

	/**
	 * @brief stops the hardware timer
	 * 
	 */
	static void htl_timer_stop(void);

	/**
	 * @brief changes the prescaler of the timer
	 * 
	 * @param prescaler to be set
	 */
	static void htl_change_prescaler(uint16_t prescaler);

	/**
	 * @brief changes overflow of the hardware timer
	 * 
	 * @param overflow to be set
	 */
	static void htl_change_overflow(uint64_t overflow);

	/**
	 * @remark this is the child process
	 * 
	 * @param parameter is 0 by default
	 */
	static void htl_timer_process(void* parameter = 0);

	/**
	 * @remark IRAM_ATTR forces code into IRAM instead of flash
	 * 
	 */
	static void IRAM_ATTR htl_timer_isr(); // interrupt service routine. Keep in IRAM
};

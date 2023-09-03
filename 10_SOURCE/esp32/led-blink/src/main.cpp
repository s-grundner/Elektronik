#include <Arduino.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "freertos/timers.h"
#include "freertos/semphr.h"

#include "esp_log.h"

#define led0 (GPIO_NUM_4)

/**
 * (1) Init
 * (2) start Timer
 * (3) wenn OnTimer
 */

class HW_Timer
{
  public:
    static SemaphoreHandle_t timer_sem;
    static xTimerHandle_t blink_timer;
    init(void);
    process_timer(void);
    on_timer(void;)
  private:
}

void HW_Timer::init(void)
{
  vSemaphoreCreateBinary(this->timer_sem);
  xTimerCreate(
    "Blink Timer",
    pdMS_TO_TICKS(1000),
    pdTrue,
    (void*)0,
    this->on_timer,
  )
}

void HW_Timer::process_timer(void)
{
  for(;;)
  {
    if(xSemaphoreTake())
  }
}

void IRAM_ATTR HW_Timer::on_timer(xTimerHandle_t blink_timer_a)
{

}

void setup()
{
  gpio_config_t led0_conf= {
    .mode = GPIO_MODE_OUTPUT,
    .pin_bit_mask = (1<<led0),
  };
  gpio_config(&led0_conf);
}

void loop() {
  // put your main code here, to run repeatedly:
}
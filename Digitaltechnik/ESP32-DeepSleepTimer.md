## 08_DeepSleepTimer

(<https://randomnerdtutorials.com/esp32-deep-sleep-arduino-ide-wake-up-sources/)>

Um Energie zu sparen (Batterie-Lösungen) kann der ESP32 in einen Deep-Sleep versetzt werden. Aufgeweckt werden kann er mittels Timer oder externen Signals. Hier als Beispiel die Variante mittels Timer:

```c++
#include <Arduino.h>
#include <ArduinoJson.h>

#define uS_TO_S_FACTOR 1000000  /* Conversion factor for micro seconds to seconds */
#define TIME_TO_SLEEP  5        /* Time ESP32 will go to sleep (in seconds) */
RTC_DATA_ATTR int bootCount = 0;

/*
Method to print the reason by which ESP32
has been awaken from sleep
*/
void print_wakeup_reason(){
    esp_sleep_wakeup_cause_t    wakeup_reason;

    wakeup_reason = esp_sleep_get_wakeup_cause();

    switch(wakeup_reason) {
        case ESP_SLEEP_WAKEUP_EXT0 : Serial.println("External signal using RTC_IO"); break;
        case ESP_SLEEP_WAKEUP_EXT1 : Serial.println("External signal using RTC_CNTL"); break;
        case ESP_SLEEP_WAKEUP_TIMER : Serial.println("Timer"); break;
        case ESP_SLEEP_WAKEUP_TOUCHPAD : Serial.println("Touchpad"); break;
        case ESP_SLEEP_WAKEUP_ULP : Serial.println("ULP program"); break;
        default : Serial.printf("No deep sleep: %d\n",wakeup_reason); break;
    }
}

void setup() {
    // Initialize serial port
    Serial.begin(9600);
    Serial.println("\n08_DeepSleepTimer\n\n");
    delay(1000); //Take some time to open up the Serial Monitor

    //Increment boot number and print it every reboot
    ++bootCount;
    Serial.println("Boot number: " + String(bootCount));

    //Print the wakeup reason for ESP32
    print_wakeup_reason();

    esp_sleep_enable_timer_wakeup(TIME_TO_SLEEP * uS_TO_S_FACTOR);
    Serial.println("Setup ESP32 to sleep for every " + String(TIME_TO_SLEEP) + " Seconds");
        
    Serial.println("Going to sleep now");
    delay(1000);
    Serial.flush();				// Finish communication before leaving

    esp_deep_sleep_start();
    Serial.println("This will never be printed");
}

void loop() {       // <-- never reached: ESP32 falls asleep during setup
    Serial.println("loop .............."); 
    delay(10000); 
}
```

Nach dem Aufwecken startet die Arduino-SW wieder im `setup()`. Die Erkennung ob der Controller gestartet oder wieder aufgeweckt worden ist, kann mittels `esp_sleep_get_wakeup_cause()` erfolgen.

Ablauf:

- Setzen des Wakeup-Timers `esp_sleep_enable_timer_wakeup(  …time…  )`
- Schlafen legen mit `esp_deep_sleep_start()` 
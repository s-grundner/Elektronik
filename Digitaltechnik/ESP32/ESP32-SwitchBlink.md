## SwitchBlink

Einlesen der Schalterzustände und Aktivieren von LEDs.

<https://www.arduino.cc/reference/en/libraries/digitalio/>

Grundsätzliche Struktur: 

![](../../_assets/Esp32_SwitchLed.png)

```cpp
#include <Arduino.h>

#define PORT_LED0 14
#define PORT_SW2 25

void setup() {
    pinMode(PORT_LED0, OUTPUT);    	// LED-Output
    pinMode(PORT_SW2, INPUT);      	// Switch-Input

    Serial.begin(9600);			 	// Serial-Monitor-Config
    Serial.print("\n01_SwitchBlink\n\n");
    Serial.println("setup");
}

int sw2 = 0;	// Remember Switch-Status

void loop() {
    Serial.printf("SW2 = %d\n", sw2);

    sw2 = !digitalRead(PORT_SW2);     // Read Switch
    digitalWrite(PORT_LED0, sw2);     // Write LED

    delay(1000);                      // 1s wait
}
```
## SwitchBlink ISR

Einlesen der Schalterzustände mittels Interrupt und Aktivieren von LEDs.

<https://www.arduino.cc/reference/de/language/functions/external-interrupts/attachinterrupt/>

Grundsätzliche Struktur: 

![](../../_assets/Esp32_SwitchLed.png)

```cpp
#include <Arduino.h>

#define PORT_LED0 14
#define PORT_SW2 25

volatile byte swState = LOW;

void IRAM_ATTR isr_sw2() {
  swState = digitalRead(PORT_SW2);     // Read Switch
}

void setup() {
  pinMode(PORT_LED0, OUTPUT);         // LED-Output
  pinMode(PORT_SW2, INPUT);           // Switch-Input
  // on each (falling/rising) state-change:
  attachInterrupt(PORT_SW2, isr_sw2, CHANGE);

  Serial.begin(9600);                 // Serial-Monitor-Config
  Serial.print("\n01b_SwitchBlink_ISR\n\n");
}

void loop() {
  digitalWrite(PORT_LED0, swState);   // Write LED
  Serial.printf("SW2 = %d\n", swState);
}
```
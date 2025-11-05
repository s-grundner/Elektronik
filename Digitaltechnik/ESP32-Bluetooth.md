## ESP32-Bluetooth

Mit diesem Beispiel kann mittels z.B. Mobiltelefon auf Bluetooth gepairt werden. Mit einem Bluetooth-Terminal (Serial Bluetooth …) können anschließend Daten an den ESP gesendet werden und im Serial-Monitor angezeigt werden. Verändern Sie in den Bluetooth-Namen *_$$$$* auf das Namenskürzel.

```cpp
#include <Arduino.h>
#include "BluetoothSerial.h"

#if !defined(CONFIG_BT_ENABLED) || !defined(CONFIG_BLUEDROID_ENABLED)
#error Bluetooth is not enabled! Please run `make menuconfig` to and enable it
#endif

BluetoothSerial SerialBT;

void setup() {
  Serial.begin(9600);
  Serial.println("\n04_BlueTooth\n\n");
  SerialBT.begin("ESP32_$$$$"); //Bluetooth device name
  Serial.println("ESP32 wurde gestartet. Es kann gepaired werden.");
}

void loop() {
  if (Serial.available()) {
    SerialBT.write(Serial.read());
  }
  if (SerialBT.available()) {
    Serial.write(SerialBT.read());
  }
  delay(20);
}
```
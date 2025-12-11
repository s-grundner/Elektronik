## 06_BMP280

Der BMP280 ist mit dem ESP32 mittels I²C-Bus verbunden (der Sensor kann auch mittels SPI eingebunden werden):

![img](../_assets/ESP32_BMP280.png)

Für diese Projekte muss die Library **Adafruit BMP280 Library** installiert werden (PlatformIO.ini):

```
lib_deps = adafruit/Adafruit BMP280 Library @ 2.3.0
```

Standard-Beispiel aus dem Bibliotheks-Import:

```cpp
/***************************************************************************
  This is a library for the BMP280 humidity, temperature & pressure sensor

  Designed specifically to work with the Adafruit BMP280 Breakout
  ----> http://www.adafruit.com/products/2651

  These sensors use I2C or SPI to communicate, 2 or 4 pins are required
  to interface.

  Adafruit invests time and resources providing this open source code,
  please support Adafruit andopen-source hardware by purchasing products
  from Adafruit!

  Written by Limor Fried & Kevin Townsend for Adafruit Industries.
  BSD license, all text above must be included in any redistribution
 ***************************************************************************/

#include <Wire.h>
#include <SPI.h>
#include <Adafruit_BMP280.h>

#define BMP_SCK  (13)
#define BMP_MISO (12)
#define BMP_MOSI (11)
#define BMP_CS   (10)

Adafruit_BMP280 bmp; // I2C
//Adafruit_BMP280 bmp(BMP_CS); // hardware SPI
//Adafruit_BMP280 bmp(BMP_CS, BMP_MOSI, BMP_MISO,  BMP_SCK);

void setup() {
    Serial.begin(9600);
    Serial.println(F("\n06_BMP280\n\n"));

    if (!bmp.begin(BMP280_ADDRESS_ALT, BMP280_CHIPID)) {
    //if (!bmp.begin()) {
    Serial.println(F("Could not find a valid BMP280 sensor, check wiring or "
    "try a different address!"));
    while (1) delay(10);
    }

    /* Default settings from datasheet. */
    bmp.setSampling(Adafruit_BMP280::MODE_NORMAL,     /* Operating Mode. */
    Adafruit_BMP280::SAMPLING_X2,     /* Temp. oversampling */
    Adafruit_BMP280::SAMPLING_X16,    /* Pressure oversampling */
    Adafruit_BMP280::FILTER_X16,      /* Filtering. */
    Adafruit_BMP280::STANDBY_MS_500); /* Standby time. */
}

void loop() {
    Serial.print(F("Temperature = "));
    Serial.print(bmp.readTemperature());
    Serial.println(" *C");

    Serial.print(F("Pressure = "));
    Serial.print(bmp.readPressure());
    Serial.println(" Pa");

    Serial.print(F("Approx altitude = "));
    Serial.print(bmp.readAltitude(2000));  // <- Calibrate1013.25
    Serial.println(" m");

    Serial.println();
    delay(2000);
}
```

In Tests wurde die *alternative* Adressierung bestätigt:

```
if (!bmp.begin(BMP280_ADDRESS_ALT, BMP280_CHIPID))
```

sollte damit keine Verbindung aufgebaut werden können (es gibt auf dem Markt wohl verschiedene Varianten), dann muss die Standardvariante verwendet werden:

```
if (!bmp.begin())
```
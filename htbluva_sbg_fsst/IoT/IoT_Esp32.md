# ESP32

Der ESP32 ist eine 32-Bit-µController-Familie der chinesischen Firma Espressif. Das Hauptaugenmerk bei der Entwicklung ist das er kostengünstig und geringen Leistungsbedarf. Aus diesem Grund sind ESP32 bedeutend im Bereich IoT geworden.

Für die SW-Entwicklung sind verschiedene Entwicklungsplattformen gängig, unter Anderen das SDK von Espressif (ESP-IDF) oder aber Arduino. In dieser Anleitung wird die Arduino-Variante ausgewählt (ist die einfachere für den Einstieg).

- als Editor wird VSCode verwendet
- für die Toolkette wird Python benötigt
- für die Entwicklung von µController-Software gibt's die Extension PlatformIO

(Beschreibung: https://randomnerdtutorials.com/vs-code-platformio-ide-esp32-esp8266-arduino/)

## Allgemein

In VSCode kann ein Projekt gestartet werden:

- VSCode -> Platformio -> Home-Open -> New Project
- Auswahl Board: **ESP32 Pico Kit (Espressif)**.
- Framework: Arduino

Die *Projektkonfiguration* wird in der Datei platformio.ini abgelegt und hat hauptsächlich diesen Inhalt:

```ini
[env:pico32]
platform = espressif32
board = pico32
framework = arduino
monitor_speed= 115200       ; Communication via Serial-Monitor
```

Zum Hinzufügen zusätzlicher Libraries zum Projekt, können diese direkt in der Konfiguration `platfromio.ini` angegeben oder mittels PlatformIO eingefügt werden (VSCode -> Platfomio -> Libraries ->...).

PlatformIO speichert Bibliotheken und Konfigurationen üblicherweise unter `C:\Users\xxxxxxxx\.platformio` (Windows).

**HTL-Board:**

Das ESP32-SG-Board (HTL-ESP32) ist bestückt mit:

- ESP32-Pico

- 4 LEDs - Ports IO14 (RTC_GPIO16), IO27 (RTC_GPIO17), IO32 (RTC_GPIO9), IO33 (RTC_GPIO8).
- 3 Schalter - Ports IO13 (RTC_GPIO14), IO15 (RTC_GPIO13), IO25 (GPIO25) 

Die DigitalIO-Konfiguration kann mittels dieser *Defines* abgebildet werden:

```
#define PORT_LED0 14
#define PORT_LED1 27
#define PORT_LED2 32
#define PORT_LED3 33

#define PORT_SW4 15
#define PORT_SW3 13
#define PORT_SW2 25
```

Serial-Monitor - Setup Baudrate und Ausgabe (Arduino.h):

```cpp
Serial.begin(115200);
Serial.println("Hello from ESP32");
```

Im Folgenden sind ein paar Beispiel-Sourcen für notwendige Funktionalitäten.

## 01_SwitchBlink

Einlesen der Schalterzustände und Aktivieren von LEDs.

https://www.arduino.cc/reference/en/libraries/digitalio/

Grundsätzliche Struktur: 

![](./bilder/Esp32_SwitchLed.png)

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

## 01b_SwitchBlink_ISR

Einlesen der Schalterzustände mittels Interrupt und Aktivieren von LEDs.

https://www.arduino.cc/reference/de/language/functions/external-interrupts/attachinterrupt/

Grundsätzliche Struktur: 

![](./bilder/Esp32_SwitchLed.png)

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

## 02_WiFi

Verbinden als einfacher Endpunkt in einem WLAN.

https://www.arduino.cc/en/Reference/WiFi

```cpp
#include <WiFi.h>

void setup() {
	const char *ssid = "FORTI_INTERNET";
	const char *pass = "XXXXxxxxxxx";

	Serial.begin(9600);         		// Serielle Schnittstelle initialisieren
	Serial.print("\n02_WiFi\n\n");
	WiFi.mode(WIFI_MODE_STA);           // Station Mode = Endpoint
	WiFi.begin(ssid, pass);
	while(WiFi.status() != WL_CONNECTED) {
		delay(500);
		Serial.println("Connecting to WiFi...");
	}
	Serial.println("Connection established.");
	Serial.println("Mac: " + WiFi.macAddress()); 
  	Serial.println("IP:  " + WiFi.localIP().toString()); 
}

void loop() {
	WiFi.disconnect();
}

```

Ähnlich einfach ist es ESP32 als Access-Point aufzusetzen (ist im nächsten Beispiel inkludiert)

## 03_WebServer

Diese WebServer-Applikation Erzeugt auf der Adresse 192.168.4.1 die folgende Seite:

![image-20210530174045130](./bilder/Esp32_WebServer02.png)

Das einzige Element ist ein Formular mit einem Button (0.html). Durch aktivieren des Buttons wird auf die Seite 1.html umgeschaltet (aktivierter Schalter) und die LED geschaltet.

![](./bilder/Esp32_WebServer.png)

Aufbau WiFi-AccessPoint. Hier in *astral_$$$$* user auf das eigene Benutzerkürzel verändern:

```cpp
#include <Arduino.h>
#include <WiFi.h>

void setup() {
	Serial.begin(9600);
	Serial.print("\n03_WebServer\n\nInitialisiere WLAN-AP \"astral\"...\n");
	Serial.print("\nInitialisiere WLAN-AP ...\n");
	boolean result = WiFi.softAP("astral_$$$$", "12345678");
	if(result == true) {
		Serial.println("Bereit zum Anmelden ...\n");
	}
	else {
		Serial.println("Initialisierung misslungen!\n");
	}
}

void loop() {
	if (WiFi.softAPgetStationNum())
		Serial.print("Benutzer angemeldet\n");
	delay(3000);
}
```

Der gesamte WebServer samt AccessPoint (wieder _$$$$ durch Namenskürzel ersetzen):

```cpp
// WLAN: astral_$$$$/12345678 wird unter 192.168.4.1 ein Schalter angeboten
// Mit diesem kann eine LED geschaltet werden

#define PORT_LED0 14

#include <WiFi.h>
#include <WebServer.h>

String html1 = "<!DOCTYPE html>\r\n<html>\r\n\
<head>\r\n<meta content=\"text/html; charset=ISO-8859-1\" http-equiv=\"content-type\">\r\n\
<title>WebSchalter</title>\r\n\
<form action=\"";

String html2 = "\">\r\n<input value=\"ON/OFF\" style=\"";

String html3 = " width:5em;height:3em; font-size: 16px;\" type=\"submit\">\
</form>\r\n</head>\r\n<body>\r\n</body>\r\n</html>";

WebServer server(80);            // Server Port 80
int val = HIGH;                  // Startzustand ausgeschaltet
String Temp = "";

void Ereignis_SchalteON() {      // Ausfuehrung mit ".../1.html"
	val = LOW;                   // LED Ein
	digitalWrite(PORT_LED0, val);
	Temp = html1 + String((val) ? "/1.html" : "/0.html");
	Temp += html2 + String((val) ? "BACKGROUND-COLOR: DarkGray;" : "BACKGROUND-COLOR: Chartreuse;") + html3;
	server.send(200, "text/html", Temp);
	Serial.print("EIN\n");
}

void Ereignis_SchalteOFF() {     // Ausfuehrung mit ".../0.html"
	val = HIGH;                  // LED Aus
	digitalWrite(PORT_LED0, val);
	Temp = html1 + String((val) ? "/1.html" : "/0.html");
	Temp += html2 + String((val) ? "BACKGROUND-COLOR: DarkGray;" : "BACKGROUND-COLOR: Chartreuse;") + html3;
	server.send(200, "text/html", Temp);
	Serial.print("AUS\n");
}

void Ereignis_Index() {         // Wird ausgeuehrt wenn ".../" aufgerufen wurde
  Temp = html1 + String((val) ? "/1.html" : "/0.html");
  Temp += html2 + String((val) ? "BACKGROUND-COLOR: DarkGray;" : "BACKGROUND-COLOR: Chartreuse;") + html3;
  server.send(200, "text/html", Temp);
}

void setup() {
	pinMode(PORT_LED0, OUTPUT);   // LED-Pin als Ausgang
	digitalWrite(PORT_LED0, val);

	Serial.begin(9600);           // Serielle Schnittstelle initialisieren
	Serial.print("\n03_WebServer\n\n");
	Serial.println("");
	Serial.println("Starte WLAN-Hotspot \"astral\"");
	WiFi.mode(WIFI_AP);           // access point modus
	WiFi.softAP("astral_$$$$", "12345678");    // Name des Wi-Fi netzes
	delay(500);
	Serial.print("IP Adresse ");  //Ausgabe aktuelle IP des Servers
	Serial.println(WiFi.softAPIP());

	//  Behandlung der Ereignisse anschliessen
	server.on("/", Ereignis_Index);
	server.on("/1.html", Ereignis_SchalteON);
	server.on("/0.html", Ereignis_SchalteOFF);

	server.begin();               // Starte den Server
	Serial.println("HTTP Server gestartet");
}

void loop() {
	server.handleClient();
}
```

## 04_Bluetooth

Mit diesem Beispiel kann mittels z.B. Mobiltelefon auf Bluetooth gepairt werden. Mit einem Bluetooth-Terminal (Serial Bluetooth ...) können anschließend Daten an den ESP gesendet werden und im Serial-Monitor angezeigt werden. Verändern Sie in den Bluetooth-Namen *_$$$$* auf das Namenskürzel.

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

## 05_Mqtt

In diesem Projekt wird mit einem WLAN-Accesspoint verbunden, anschließend auf den MQTT-Broker `test.mosquitto.org` und anschließend ein Zähler gesendet. Gleichzeitig wird ein Topic subscribed und wenn empfangen im Seriellen Monitor ausgegeben.

![image-20210530174045130](./bilder/Esp32_Mqtt.png)

Passen Sie die WiFi-Einstellungen und die Topics entsprechend an (im Topic wird $$$$ durch das Namenskürzel ersetzt, das Gleiche gilt für die User-Id, diese muss eindeutig zuordenbar sein):

```c++
#include <WiFi.h>
#include <PubSubClient.h>

// Update these with values suitable for your network.
const char* ssid = "FORTI_INTERNET";
const char* password = "XXXXxxxxxxx";
const char* mqtt_server = "test.mosquitto.org";
int num = 0;
#define MQTT_SERIAL_PUBLISH_CH "home/EspDataTx_$$$$"
#define MQTT_SERIAL_RECEIVER_CH "home/EspDataRx_$$$$"

WiFiClient wifiClient;
PubSubClient client(wifiClient);

void callback(char* topic, byte *payload, unsigned int length) {
    Serial.print("\n---New Message From Broker---: ");
    Serial.printf("channel: (%s), data: (", topic);
    Serial.write(payload, length);
    Serial.println(")");
}

void setup() {
    // Serial
    Serial.begin(9600);
    Serial.println("\n05_Mqtt\n\n");

    // Wifi
    delay(500);
    WiFi.begin(ssid, password);
    Serial.print("Connection to WiFi .");
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }
    Serial.print("... Connection established, IP (");
    Serial.print(WiFi.localIP());
    Serial.println(")");

    // MQTT
    Serial.print("Connection to MQTT-Broker .");
    client.setServer("test.mosquitto.org", 1883); //<-- Prepare Connection
    client.setCallback(callback);                 //<-- Callback Function for Subscribed Topic
    while (!client.connect("Client-Id-$$$$")) {   //<-- Wait for established Connection
        delay(500);
        Serial.print(".");
    }
    client.subscribe(MQTT_SERIAL_RECEIVER_CH);  //<-- Subscribe on Topic
    Serial.print("... Mosquitto-Connection established.\n");
    Serial.printf("Transmitting data (Topic %s).", MQTT_SERIAL_PUBLISH_CH);
}

void loop() {
    client.loop();
    delay(500);
    char str[10];
    client.publish(MQTT_SERIAL_PUBLISH_CH, itoa(num++, str, 10));
    Serial.print(".");
 }
```

## 05b_Mqtt

In diesem Projekt werden die WiFi-Verbindungsdaten und die Adresse der MQTT-Brokers in einer eigenen Datei abgelegt. Dafür sind SPIFFS und FS notwendig.

![image-20210530174045130](./bilder/Esp32_Mqtt.png)

Vorab: Installation der Library PubSubClient, in **PlatformIO.ini**:

```
lib_deps =
  knolleary/PubSubClient @ ^2.8
```

In der Shell muss die Datei data/wlan.txt hochgeladen werden:

```
pip install -U platformio
platformio run --target uploadfs
```

Im Projektverzeichnis wird ein Ordner data angelegt und die Datei wlan.txt darin abgelegt mit dem folgenden Inhalt:
**data/wlan.txt**:

```
SSID=FORTI_INTERNET;PSK=XXXXxxxxxxx;MQTT_BROKER=test.mosquitto.org;
```

Damit kann die SSID/Kennwort aber auch die Adresse des MQTT-Brokers nach dem Flashen des Codes verändert werden.

Code (_$$$$ im Topic und in der MQTT-User-Id verändern):

```cpp
#include "FS.h"
#include "SPIFFS.h"

/* You only need to format SPIFFS the first time you run a
   test or else use the SPIFFS plugin to create a partition
   https://github.com/me-no-dev/arduino-esp32fs-plugin */
#define FORMAT_SPIFFS_IF_FAILED true

#include <WiFi.h>
#include <PubSubClient.h>

// Daten werden aus SPIFFS genommen, dazu werden
// sie sämtliche Dateien im Verzeichnis "data" mittels 
//      "platformio run --target uploadfs"
// auf den ESP32 geladen. Die Datei muss wlan.txt heißen und:
//      SSID=FORTI_INTERNET;PSK=HTLInternet;MQTT_BROKER=test.mosquitto.org;
// beinhalten

char SSID[255] = "";
char PSK[255] = "";
char MQTT_BROKER[255] = "";

char str[255];			// Message received by Serial
int pos = 0;			// Fuer Empfangsnachricht von Serial
int state = 0;			// Fuer Empfangsnachricht von Serial
int ctr = 0;            // Ausgabezaehler

WiFiClient espClient;
PubSubClient client(espClient);


void setup_wifi();

int getCfgDta(char dta[]) {
	int num = 0;
	char *tok = strtok(dta, "=");
	while ((tok != NULL) && (num <3)) {
		if (strncmp(tok, "SSID", 4) == 0) {
			if ((tok = strtok(NULL, ";")) == 0) return 0;
			strncpy(SSID, tok, 20);
			num++;
			Serial.printf("[CFG] SSID: %s\n", SSID);
		}
		else if (strncmp(tok, "PSK", 3) == 0) {
			if ((tok = strtok(NULL, ";")) == 0) return 0;
			strncpy(PSK, tok, 20);
			num++;
			Serial.printf("[CFG] PSK: %s\n", PSK);
		}
		else if (strncmp(tok, "MQTT_BROKER", 11) == 0) {
			if ((tok = strtok(NULL, ";")) == 0) return 0;
			strncpy(MQTT_BROKER, tok, 20);
			num++;
			Serial.printf("[CFG] MQTT_BROKER: %s\n", MQTT_BROKER);
		}
		else return -1;
		tok = strtok(NULL, "=");
	}
	return num;
}

void readCfgFile(fs::FS &fs, const char * path){
    File file = fs.open(path);
    if(!file || file.isDirectory()){
        Serial.println("- Error while opening File for reading");
        return;
    }

    Serial.printf("[FS] Reading Config-File (%s):", path);
    char cfgFile[255];
    int idx = 0;

    while(file.available() && idx < 255){
    	cfgFile[idx++] = file.read();
    }
    file.close();
    Serial.printf("\"%s\"\n", cfgFile);
    getCfgDta(cfgFile);
}

void writeFile(fs::FS &fs, const char * path, const char * message){
    Serial.printf("[FS] Writing Configuration (%s) ... ", path);

    File file = fs.open(path, FILE_WRITE);
    if(!file){
        Serial.println("- Error while accesing File");
        return;
    }
    if(file.print(message)){
        Serial.println(" OK");
    } else {
        Serial.println("- Error while writing");
    }
}

void setup_wifi() {
    delay(10);
    Serial.printf("[WiFi] Attempting connection with WLAN (%s) .", SSID);

    WiFi.begin(SSID, PSK);

    int ctr = 0;
    while ((WiFi.status() != WL_CONNECTED) && (ctr < 10)) {
        delay(500);
        Serial.print(".");
        ctr++;
    }

    Serial.print(" OK, IP: (");
    Serial.print(WiFi.localIP());			// liefert nur Typ string zurueck ...
    Serial.println(")");
}

void mqtt_reconnect() {
    if (!client.connected()) {
        Serial.printf("[MQTT-Broker] Attempting connect with (%s) ...", MQTT_BROKER);
        if (!client.connect("espressif_$$$$")) {        // hier wird solange versucht bis Verbunden oder Timeout
            Serial.print("Error, RetCode=");
            Serial.println(client.state());             // States sind in PubSubClient.h zu finden -4 = TIMEOUT
        } else {
        	Serial.println(" OK");
            client.subscribe("home/inData");
        }
    }
}


void chkCom() {
	while (Serial.available() > 0) {
		int dta = Serial.read();
		str[pos++] = dta;
		if (state == 0) {
			state = 1;
		}
		if (state == 1) {
			if (dta == 13) {
				str[pos] = 0;
				state = 2;
				Serial.printf("\n_%s_\n", str);
			}
		}
	}

	if (state == 2) {
		state = 0;
		pos = 0;
	}
}

void(* resetFunc) (void) = 0;//declare reset function at address 0

void procData() {

	if (getCfgDta(str) == 3) {
        if(!SPIFFS.begin(FORMAT_SPIFFS_IF_FAILED)){
            Serial.println("SPIFFS Mount Failed");
            return;
        }
        char ssss[1000];
        sprintf(ssss, "SSID=%s;PSK=%s;MQTT_BROKER=%s;", SSID, PSK, MQTT_BROKER);
        writeFile(SPIFFS, "/wlan.txt", ssss);
    }
    str[0] = 0;
    //delay(1000);

    //resetFunc(); //call reset
}

void callback(char* topic, byte *payload, unsigned int length) {
    Serial.print("[MQTT] Recv: \"");
    Serial.print(topic);
    Serial.print("|");
    Serial.write(payload, length);
    ctr = atoi((char*)payload);
    Serial.println("\"");
}

void setup() {
    Serial.begin(9600);
    Serial.println("\n05b_Mqtt\n\n");

    SPIFFS.begin();
    readCfgFile(SPIFFS, "/wlan.txt");

    setup_wifi();
    client.setServer(MQTT_BROKER, 1883);
    client.setCallback(callback);
}

void loop() {
	chkCom();
	procData();
    mqtt_reconnect();
    client.loop();

    char str[40];
    sprintf(str, "Hello World from ESP32, ctr = %i", ctr++);
    client.publish("home/outData_$$$$", str);
    Serial.printf("[MQTT] Send: \"home/outData|%s\"\n", str);
    delay(5000);
}

```

Installation von Mosquitto, damit können die hochgeladenen Daten in der Kommandozeile subskribiert werden:

```
mosquitto_sub -h test.mosquitto.org -t "home/outData"
```

Testhalber können auch Daten publiziert werden:

```
mosquitto_pub -h test.mosquitto.org -t "home/outDatat" -m "ESP32-Test"
```

## 06_BMP280

Der BMP280 ist mit dem ESP32 mittels I²C-Bus verbunden (der Sensor kann auch mittels SPI eingebunden werden):

![img](./bilder/ESP32_BMP280.png)

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

## 07_Json

Für diese Projekte muss die Library **ArduinoJson by Benoit Blanchon** installiert werden (PlatformIO.ini):

```
lib_deps = bblanchon/ArduinoJson @ 6.18.0
```

Beispiel Deserialisieren mittels JSON-Lib:

```cpp
// ArduinoJson - arduinojson.org
// Copyright Benoit Blanchon 2014-2019
// MIT License
//
// This example shows how to deserialize a JSON document with ArduinoJson.
//
// https://arduinojson.org/v6/example/parser/

#include <Arduino.h>
#include <ArduinoJson.h>

long json_time ; 
double latitude; 
double longitude; 
String sensor; 
    // Allocate the JSON document
    StaticJsonDocument<200> doc; 

void setup() {
    // Initialize serial port
    Serial.begin(9600);
    Serial.println("\n07_Json\n\n");    
    //while (! Serial) continue; 

    Serial.println("........ JSON setup ........................"); 


    // StaticJsonDocument<N> allocates memory on the stack, it can be
    // replaced by DynamicJsonDocument which allocates in the heap.
    //
    // DynamicJsonDocument doc(200); 

    // JSON input string.
    //
    // Using a char[], as shown here, enables the "zero-copy" mode. This mode uses
    // the minimal amount of memory because the JsonDocument stores pointers to
    // the input buffer.
    // If you use another type of input, ArduinoJson must copy the strings from
    // the input to the JsonDocument, so you need to increase the capacity of the
    // JsonDocument.

    char json[] =
        "{\"sensor\":\"gps\",\"time\":1351824120,\"data\":[48.756080,2.302038]}";

    // Deserialize the JSON document
    DeserializationError error = deserializeJson(doc, json); 

    // Test if parsing succeeds.
    if (error) {
        Serial.print(F("deserializeJson() failed: "));
        Serial.println(error.c_str());
        return;
    }

    // Fetch values.
    //
    // Most of the time, you can rely on the implicit casts.
    // In other case, you can do doc["time"].as<long>(); 
    sensor = doc["sensor"].as<String>(); 
    json_time = doc["time"].as<long>(); 
    latitude = doc["data"][0].as<double>();
    longitude = doc["data"][1].as<double>();

    // Print values.
    Serial.println("setup............ "); 
    Serial.println(sensor); 
    Serial.println(json_time); 
    Serial.println(latitude, 6); 
    Serial.println(longitude, 6); 
}

void loop() {
    Serial.println("loop .............."); 
    Serial.println(sensor); 
    Serial.println(json_time); 
    Serial.println(latitude, 6); 
    Serial.println(longitude, 6); 
    delay(10000); 
}
```

Liefert auf dem Serial-Monitor:

```
setup............
gps
1351824120
48.756081
2.302038
loop ..............
gps
1351824120
48.756081
2.302038
```

-> Das Json-Dokument ist ein Assoziatives Array.

MemoryLeaks können einfach mit `memoryUsage()` beobachtet werden.

**Serialize**:

```cpp
StaticJsonDocument<256> doc; 
String sensor = "DS2788";
double lat = 48.7;
double lon = 2.3;
double temp = 22.23;

doc["sensor"] = serialized(sensor);
JsonArray data = doc.createNestedArray("data");
data.add(lat);
data.add(lon);
doc["temp"] = serialized(String(temp));  // String erzeugt immer eine Kopie --> MemLeak

String output;
serializeJson(doc, output);

Serial.println(output);		// {"sensor":DS2788,"data":[48.7,2.3],"temp":22.23}
```

**Deserialize**:

```cpp
char json[] = "{\"sensor\":\"gps\",\"temp\":22.23,\"data\":[48.7,2.3]}";
StaticJsonDocument<256> doc; 

String sensor = doc["sensor"].as<String>();     // DS2788
double lat = doc["data"][0].as<double>();       // 48.7
double lon = doc["data"][1].as<double>();       // 2.3
double temp = doc["temp"].as<double>();         // 22.23
```

## 08_DeepSleepTimer

(https://randomnerdtutorials.com/esp32-deep-sleep-arduino-ide-wake-up-sources/)

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

- Setzen des Wakeup-Timers `esp_sleep_enable_timer_wakeup(  ...time...  )`
- Schlafen legen mit `esp_deep_sleep_start()` 

## Troubleshooting

- **Programmieren nicht möglich**. Es kann vorkommen, dass eine Kommunikation mit dem ESP32 via SerialMonitor möglich ist, ein Programmieren allerdings nicht. Dann muss während dem Start der Programmierung der Boot-Button gedrückt gehalten werden bis die Programmierung startet (siehe https://randomnerdtutorials.com/esp32-troubleshooting-guide/  Pkt. 4).

## Referenzen

- µController ESP32-Pico

  [Link-Espressif ESP32-Pico](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/hw-reference/esp32/get-started-pico-kit.html#)

  [ESP32-Pico Getting Started](./Esp32Pico/Espressif_Systems_01162019_ESP32-PICO-KIT-1523019.pdf)

  [ESP32-Pico Technical Reference Manual](./Esp32Pico/esp32_technical_reference_manual_en.pdf)

  [ESP32-Pico Datasheet](./Esp32Pico/esp32-pico-d4_datasheet_en.pdf)

  [ESP32-Pico Schematic](./Esp32Pico/esp32-pico-kit-v4.1_schematic.pdf)

- Arduino-Framework
  https://www.arduino.cc/reference/en/libraries/

- Setup/Installation ESP32 Projekte mit Arduino-Framework auf PlatformIO
   https://randomnerdtutorials.com/vs-code-platformio-ide-esp32-esp8266-arduino/
- Setup/Installation ESP-IDF mit PlatformIO
  https://docs.platformio.org/en/latest/tutorials/espressif32/espidf_debugging_unit_testing_analysis.html#tutorial-espressif32-espidf-debugging-unit-testing-analysis
  
  https://docs.platformio.org/en/latest/frameworks/espidf.html

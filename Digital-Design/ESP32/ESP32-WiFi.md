## 02_WiFi

Verbinden als einfacher Endpunkt in einem WLAN.

<https://www.arduino.cc/en/Reference/WiFi>

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
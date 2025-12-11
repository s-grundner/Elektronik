## ESP32-WebServer

Diese WebServer-Applikation Erzeugt auf der Adresse 192.168.4.1 die folgende Seite:

![image-20210530174045130](../_assets/Esp32_WebServer02.png)

Das einzige Element ist ein Formular mit einem Button (0.html). Durch aktivieren des Buttons wird auf die Seite 1.html umgeschaltet (aktivierter Schalter) und die LED geschaltet.

![](../_assets/Esp32_WebServer.png)

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

Der gesamte WebServer samt AccessPoint (wieder durch Namenskürzel ersetzen):

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
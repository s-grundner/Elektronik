## ESP32-MQTT

> [!question] [MQTT](../Softwareentwicklung/IoT/MQTT.md)

In diesem Projekt wird mit einem WLAN-Accesspoint verbunden, anschließend auf den [MQTT](../Softwareentwicklung/IoT/MQTT.md)-Broker `test.mosquitto.org` und anschließend ein Zähler gesendet. Gleichzeitig wird ein Topic subscribed und wenn empfangen im Seriellen Monitor ausgegeben.

![image-20210530174045130](../_assets/Esp32_Mqtt.png)

Passen Sie die WiFi-Einstellungen und die Topics entsprechend an (im Topic wird $$$$ durch das Namenskürzel ersetzt, das Gleiche gilt für die User-Id, diese muss eindeutig zuordenbar sein):

```cpp
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

![image-20210530174045130](../_assets/Esp32_Mqtt.png)

Vorab: Installation der Library PubSubClient, in **PlatformIO.ini**:

```
lib_deps = knolleary/PubSubClient @ ^2.8
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
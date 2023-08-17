# Temperaturmessstation

Es ist eine Temperaturmessstation zu entwerfen:

![](C:\daten\Skripten\Informatik\IoT\bilder\Config.png)

- erfaßt wird mittels Sensor die Lufttemperatur, der Luftdruck und die Luftfeuchtigkeit
- die Auswertung erfolgt mittels [ESP32](ESP32.md)
- der [ESP32](ESP32.md) sendet die Messdaten mittels [MQTT](MQTT.md)-Protokoll an den MQTT-Broker Mosquitto
- von diesem Broker wiederum werden die Daten von einem RaspberryPi abgerufen
- der Raspi legt die Daten in einer internen influxDB-Datenbank ab
- die Bedienerschnittstelle wird mittels Grafana realisiert

## 1. [ESP32](ESP32.md)

- VSCode
- Python
- Extension PlatformIO
- Setup Environment https://randomnerdtutorials.com/vs-code-platformio-ide-esp32-esp8266-arduino/
- Setup Projekt, Flash-Programmieren, Serial Monitor
- Blink-LED und einfache Projekte
- BMP280 Sensor erfassen
- [MQTT](MQTT.md)-Übertragung - Mosquitto
- JSON-Serialisierung

## 2. [Node-RED](Node-RED.md)

- Installation
- Ausführen, File-Struktur
- Einfache Flows
- [MQTT](MQTT.md)
- Deserialisierung JSON
- Dashboard
- Gemeinsame Anzeige mit OpenWeatherMap

## 3. Raspberry

- [Node-RED](Node-RED.md) auf Raspi
- Speichern in eine InfluxDB
- Dashboard auf Grafana aus der DB
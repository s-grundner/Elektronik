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
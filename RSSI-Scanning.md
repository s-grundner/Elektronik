---
tags: 
aliases: 
keywords:
  - Platz B2
subject:
  - ETT Praktikum - " 382.050"
semester: 1
created: 8. Januar 2024
professor:
---
 

# RSSI-Scanning

## LED-Lauflicht

```python
from umachine import Pin
import time
import umachine
umachine.freq(int(50e6))  # reduce power consumption

while True:
    for i in range(1,7):
        seg = Pin('LED{}'.format(i), Pin.OUT);
        seg.on()
        time.sleep(0.1)
    for i in range(1,7):
        seg = Pin('LED{}'.format(i), Pin.OUT);
        seg.off()
        time.sleep(0.1)
```

## Plotter von thonny

```python
import time  

for cnt in range(100):
    print("d1:, {}, d2:, {}, d3:, 2.5".format(cnt%5, (cnt+1)%5))
    time.sleep(0.2)
```

![](assets/Pasted%20image%2020240108133156.png)

## ESP-AT Version Abfragen

```python
import umachine

from esp32_at import ESP32_AT

umachine.freq(int(50e6))  # reduce power consumption

  

timeout = 500 # timeout in ms

uart = machine.UART(7)

esp32 = ESP32_AT(uart)

response = esp32.run_cmd('AT+GMR\r\n', timeout)

print(response)

```
  

'''

Output:

  

AT+GMR

AT version:2.2.0.0(4bfff91 - ESP32 - Aug 19 2021 08:17:22)

SDK version:v4.2.2-250-gf65845ef51

compile time(a9ed205):Oct 29 2021 11:46:49

Bin version:2.2.0(WROOM-32)

  

OK

'''
```

## WIFI Full scan

```python
import umachine
import utime
from esp32_at import ESP32_AT
umachine.freq(int(50e6))  # reduce power consumption
timeout = 3000 # timeout in ms
uart = umachine.UART(7)
esp32 = ESP32_AT(uart)
esp32.run_cmd('AT+CWMODE=1\r\n', timeout)  # act as station

start_time = utime.ticks_ms()
response = esp32.run_cmd('AT+CWLAP\r\n', timeout)
stop_time = utime.ticks_ms()
print(response)

duration = utime.ticks_diff(stop_time, start_time)
print('Duration: {} ms'.format(duration))
```

```txt
AT+CWLAP
+CWLAP:(3,"nthfs_esp2",-54,"24:6f:28:7c:1d:75",10,-1,-1,5,3,7,0)
+CWLAP:(3,"nthfs_esp3",-63,"24:62:ab:f2:66:29",10,-1,-1,5,3,7,0)
+CWLAP:(3,"nthfs_esp1",-67,"24:6f:28:7b:ad:fd",10,-1,-1,5,3,7,0)
+CWLAP:(0,"JKU",-76,"a0:e0:af:a6:7b:30",6,-1,-1,0,0,6,0)
+CWLAP:(3,"KEPLERnet",-76,"a0:e0:af:a6:7b:34",6,-1,-1,4,4,6,0)
+CWLAP:(0,"JKU",-76,"00:81:c4:e6:8e:50",11,-1,-1,0,0,6,0)
+CWLAP:(3,"KEPLERnet",-76,"00:81:c4:e6:8e:54",11,-1,-1,4,4,6,0)
+CWLAP:(5,"eduroam",-76,"00:81:c4:e6:8e:51",11,-1,-1,4,4,6,0)
+CWLAP:(5,"eduroam",-77,"a0:e0:af:a6:7b:31",6,-1,-1,4,4,6,0)
+CWLAP:(5,"eduroam",-87,"00:81:c4:2d:4b:31",1,-1,-1,4,4,6,0)
+CWLAP:(3,"DIRECT-d8-HP M281 LaserJet",-88,"c2:b5:d7:71:c1:d8",6,-1,-1,4,4,6,0)
+CWLAP:(3,"HUAWEI P30 lite",-97,"04:8c:9a:2e:2b:7d",11,-1,-1,4,4,7,0)

OK

Duration: 2546 ms
```
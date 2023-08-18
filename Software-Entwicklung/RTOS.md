---
tags: ["OS"]
aliases: ["Echtzeit Betriebsystem", "Realtime-Operatingsystem", "FreeRTOS"]
created: 18th August 2023
---

# RTOS
Oft haben Programme mehrere dedizierte Prozesse mit striktem Ablauf. Wenn nun Echtzeitdaten vermessen werden, wie zum Beispiel Audio, müssen die Laufzeiten dieser Prozesse geregelt werden, um sich gegenseitig nicht zu blockieren, da sie sich meistens einen Kern teilen. Dafür kommt ein Echtzeitbetriebssystem zum Einsatz. 

## FreeRTOS 
FreeRTOS ist ein marktführendes Echtzeitbetriebssystem, das für eingebettete Systeme und IoT-Geräte entwickelt wurde. Es bietet einen Mul-titasking-Kernel, der die gleichzeitige Ausführung mehrerer Tasks mit je-weils eigenen Prioritätsstufen und Laufzeitbeschränkungen ermöglicht. FreeRTOS ist Open Source unter der MIT Lizenz und kann privat, als auch kommerziell genutzt werden.
FreeRTOS ist hochgradig konfigurierbar und seine Struktur betont geringen Overhead und hohe Leistung, wodurch es für Systeme mit begrenzten Ressourcen geeignet ist. Es enthält Funktionen wie Task-Scheduling, Kommunikation zwischen Tasks und Speicherverwaltung. FreeRTOS ist in C geschrieben und enthält Ports für eine Vielzahl von Mikrocontrollern und Prozessoren unter anderem für [ESP32](software-entwicklung/IoT/ESP32.md) und STM32 basierte Systeme.


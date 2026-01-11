---
tags:
  - OS
aliases:
  - Echtzeit Betriebssystem
  - Realtime-Operatingsystem
  - FreeRTOS
keywords:
subject:
  - VL
  - Networked Embedded Systems
semester: WS25
created: 14th December 2025
professor:
release: false
title: RTOS
---


# RTOS

A real-time operating system (RTOS) is an operating system in electronic data processing that is capable of fulfilling the real-time requirements of applications. This means that requests from an application program or the arrival of signals via hardware interfaces are processed reliably within a predetermined period of time. The decisive factor here is not the length of the time limit, but that there is a time limit at all that can be guaranteed to be met. The need for a real-time operating system always arises when computers are connected to the physical world for measurement and/or control purposes. This is the qualitative requirement of a real-time operating system. The quantitative requirement for its real-time behavior results from the use case itself.

> Oft haben Programme mehrere dedizierte Prozesse mit striktem Ablauf. Wenn nun Echtzeitdaten vermessen werden, wie zum Beispiel Audio, müssen die Laufzeiten dieser Prozesse geregelt werden, um sich gegenseitig nicht zu blockieren, da sie sich meistens einen Kern teilen. Dafür kommt ein Echtzeitbetriebssystem zum Einsatz. 

- [Task-Scheduling](Task-Scheduling.md)

**RTOS vs "normal" OS:** A Real-Time Operating System (RTOS) is designed to provide deterministic and predictable response times to events. It guarantees that tasks are completed within specified time constraints. In contrast, a "normal" operating system, often referred to as a general-purpose operating system, prioritizes overall system efficiency and user interaction without strict time constraints. RTOS is commonly used in applications where timing and precision are critical, such as embedded systems, robotics, and control systems, while general-purpose operating systems like Windows are designed for broader computing needs.

## FreeRTOS

> [!note] https://www.freertos.org/ 

FreeRTOS ist ein marktführendes Echtzeitbetriebssystem, das für eingebettete Systeme und IoT-Geräte entwickelt wurde. Es bietet einen Mul-titasking-Kernel, der die gleichzeitige Ausführung mehrerer Tasks mit je-weils eigenen Prioritätsstufen und Laufzeitbeschränkungen ermöglicht. FreeRTOS ist Open Source unter der MIT Lizenz und kann privat, als auch kommerziell genutzt werden.  
FreeRTOS ist hochgradig konfigurierbar und seine Struktur betont geringen Overhead und hohe Leistung, wodurch es für Systeme mit begrenzten Ressourcen geeignet ist. Es enthält [Funktionen](../C/C-Funktionen.md) wie Task-Scheduling, Kommunikation zwischen Tasks und Speicherverwaltung. FreeRTOS ist in C geschrieben und enthält Ports für eine Vielzahl von Mikrocontrollern und Prozessoren unter anderem für [index](../../Digitaltechnik/ESP32/index.md) und [STM32 Setup](../../Digitaltechnik/STM/STM32%20Setup.md) basierte Systeme.

## Zephyr

> [!note] https://www.zephyrproject.org/
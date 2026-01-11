---
tags:
aliases:
keywords:
subject:
  - VL
  - Networked Embedded Systems
semester: WS25
created: 5th January 2026
professor:
release: false
title: Watchdog
---


# Watchdog

A watchdog timer is a hardware or software mechanism designed to monitor the operation of a system or a microcontroller. Its primary function is to detect and recover from malfunctions or system failures. The watchdog timer operates by setting a predefined time interval. If the system or microcontroller fails to reset or "feed" the watchdog timer within that interval, it assumes there is a fault or lock-up, triggering a corrective action. This action may involve resetting the system or taking specific measures to restore proper functionality. Watchdog timers are commonly used in embedded systems and critical applications to enhance system reliability and prevent prolonged malfunctions. 

$\rightarrow$ "seed-key" Prinzip  
![450](../_assets/watchdog.png)
> [!error] Wenn der Key nicht mit dem im LUT übereinstimmt, führt der Watchdog einen Reset durch.
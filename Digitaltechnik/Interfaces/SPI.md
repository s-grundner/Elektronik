---
tags:
  - Interface/Serial/Sync
  - MCU/Connectivity
aliases:
keywords:
subject:
  - VL
  - Networked Embedded Systems
semester: WS25
created: 9th December 2025
professor:
release: false
title: Serial Peripheral Interface
---

# SPI

SPI is a serial peripheral interface bus, which is often used in the communication with embedded systems. There are 4 lanes for communication: MOSI -> master out, slave in; MISO -> master in, slave out; SS/CS -> chip select if you have more than one slave-chip, you can choose from; SCLK -> System clock, which is produced by the master -> so this is a synchronous four-wire-communication-system. Synchronous, because the master and slave are connected via a clock line and operation synchronously.


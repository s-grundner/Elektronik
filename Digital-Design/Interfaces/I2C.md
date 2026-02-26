---
tags:
  - Interface/Serial/Sync
  - MCU/Connectivity
aliases:
  - TWI
  - Two-Wire Interface
  - Inter-Integrated-Circuit
keywords:
subject:
  - VL
  - Networked Embedded Systems
semester: WS25
created: 9th December 2025
professor:
release: false
title: Inter-Integrated Circuit
---

# I²C

I2C is short for Inter-Integrated Circuit, which literally means the interconnection between multiple ICs. I2C is a simple Communication protocol which works on a serial data bus consisting of two wires, the Serial Data Line (SDA) and the Serial [Clock](../../Analog-Design/Oszillatoren/Clock-Generierung.md) Line (SCL). The I2C-bus has following aspects:

- **Serial:** The data is transmitted on one line , where the data word is sent out bit by bit.
- **Synchronous:** The bus has a clock line, controlling when a data word begins, and a bit is read.
- **Simplex:** Transmitting and receiving data takes place on the same line, meaning only one peripheral can talk at a time.

The I2C bus requires Pull-Up resistors on each data line because the output stage only consists of a FET Pulling the bus line low, leaving the line floating during the _high_ period and the idle state. This topology is called an [Open Collector](../../Analog-Design/Open%20Collector.md) output.


I2C is usually used where the master is in short proximity to its I2C peripherals for example on printed circuit boards. Due to its bus topology, longer data lines limit the data rate due to slower rise and fall times caused by a higher bus capacitance. The edge rise time can be somewhat controlled by the pullup resistors. Lower pull ups can compensate for an increased bus capacitance ($\uptau = R\cdot C$) but affect the current consumption.

Communication via I2C works as Follows: (In this case writing one byte to a register)

- ST: Start-Bit - Pulling the Data line Low initiates a transmission
- SAD + W: 7-Bit Slave Address + Read (1) / Write (0) bit
- SAK: Slave Acknowledge
- SUB: Sub address (Register)
- DATA: 8-Bit Data-Word
- SP: Stop-Condition

| Master | ST  | SAD + W |     | SUB |     | DATA |     | SP  |
| ------ | --- | ------- | --- | --- | --- | ---- | --- | --- |
| Slave  |     |         | SAK |     | SAK |      | SAK |     |


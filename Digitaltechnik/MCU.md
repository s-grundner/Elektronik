---
tags:
aliases:
  - Microcontroller
  - Mikrokontroller
keywords:
subject:
  - VL
  - Networked Embedded Systems
semester: WS25
created: 5th January 2026
professor:
release: false
title: Mikrocontroller
---

# Microcontroller

- SPI, I2C to communicate with other devices or within a devices (e.g. on a pcb)
- microcontrollers are energy efficient
- the processor and storage is directly on the same pcb (very short distance between)
- there can also be a LAN or USB port on the uC to communicate with other devices
- it can be used to easily controll a device
- there can be a ADC on the uC where analog signals can be measured and processed
- microcontroller can be programmed. the program can be changed and adjusted as desired
- interrups, clocks, timers can be used for better and more efficient processing

## System Kernkonfigurationen

- [GPIO](GPIO.md)
- [RTOS](../Softwareentwicklung/Betriebssysteme/RTOS.md)
- [DMA](DMA.md)
- [Clock-Generierung](../Hardwareentwicklung/Oszillatoren/Clock-Generierung.md)
- [Interrupts](Interrupts.md)

## Analog

- [ADC](ADC.md)
- [DAC](DAC.md)

## Timing

**Counter:** The functionality of a counter on a microcontroller involves counting events or occurrences. The counter increments or decrements based on certain triggers, such as external signals or internal clock pulses. The concept behind a counter is to keep track of the number of events, serving various purposes like measuring time intervals, generating precise timing, or counting occurrences in digital systems. Counters can be used in applications such as timers, frequency measurement, and pulse-width modulation. A counter can count upwards or downwards.

**Timers:** The functionality of a timer on a microcontroller involves measuring and controlling time-related processes. The timer counts clock pulses and generates interrupts or triggers specific actions when a predefined time elapses (can be an overflow). This concept enables precise timing for tasks like scheduling events, generating delays, or measuring time intervals in applications like embedded systems or real-time control. It can also be combined with a capture and/or with a compare register to measure time differences, generate interrupts, generate a PWM signal, ...

## Registers

A register in a microcontroller is a small, fast storage location within the CPU. It is used to store and manipulate data temporarily during program execution. The concept involves the efficient use of these small, high-speed memory locations for quick access to data and control signals, aiding in the rapid execution of instructions and efficient management of system resources. Registers play a crucial role in the overall performance and functionality of a microcontroller.

### Capture Register

The capture register captures the counter register value and stores it in the capture register, wehen a capture event is happening. A capture event can be a input signal, ... . The captured value can than be processed further by software and can trigger further actions.

### Compare Register

The compare register compares the counter register with a preset value in the compare register. When the counter register is equal to the compare register, an action is issued. For example: interrupt, change of pin, resetting counter register, ...

### Capture & Compare Register

The Capture & Compare Register in a microcontroller is a hardware component that is used for capturing and comparing values associated with timers. It allows precise timing measurements and event triggering. The concept involves capturing the timer value when a specific event occurs and comparing it with a predefined value. This is often used in applications like pulse-width modulation (PWM) generation or capturing input signal timings, providing accurate control and synchronization in time-sensitive operations.

## Connectivity 

> [!question] [Interfaces](Interfaces/index.md)

---

## Speicher

- **Internal Memory:** Internal memory is a fast memory intern of a chip. It is preconfigured and easy to access, but has limited capacity.
- **Externer Speicher:** The external memory usually has a higher capacity, but is slower. A disadvantage is, that it needs a configuration of the memory controller (adresses and timings). It can be accessed via parallel communication (faster, many lanes/pins, ...) or serial communication protocols (less lanes/pins, but slower). 

### Flash

Flash memory is a non-volatile storage technology used in microcontrollers and other electronic devices, allowing data to be stored even when power is removed. It is a modern version of EEPROM. NAND flash is designed for high-density data storage, while NOR flash is characterized by faster read access times, making it suitable for code storage and execution in microcontrollers.

### NVRAM

NVRAM (Non-Volatile Random Access Memory) is a type of memory that retains stored data even when power is turned off. It mostly is a SRAM together with a battery. The concept involves combining the speed of RAM (Random Access Memory) for read and write operations with the non-volatile characteristics of storage, ensuring persistent data storage without the need for a continuous power source. NVRAM is commonly used in applications where data persistence is crucial, such as storing system configurations or critical parameters in electronic devices.

### ROM

ROM (Read-Only Memory) is a type of non-volatile memory that retains data even when power is turned off.
Masked ROM: It is a type of ROM where data is permanently encoded during the manufacturing process, and the stored information cannot be modified.
PROM (Programmable ROM): It allows users to program the memory once, typically through the application of electrical signals, and the programmed data remains fixed thereafter.
EPROM (Erasable Programmable ROM): EPROM can be programmed and erased multiple times using ultraviolet light for erasure, making it reusable for firmware updates.
EEPROM (Electrically Erasable Programmable ROM): EEPROM can be electrically reprogrammed, offering a convenient way to modify stored data without the need for UV light, providing flexibility for frequent updates.

### SRAM

SRAM, or Static Random Access Memory, is a type of computer memory that uses bistable latching circuitry to store each bit. Unlike dynamic RAM (DRAM), SRAM does not need to be refreshed, making it faster but also more expensive and power-consuming. The concept involves using flip-flops to store data, maintaining the information as long as power is supplied. SRAM is commonly used in microcontrollers and other applications where speed and low power consumption are crucial.

### DRAM

DRAM, or Dynamic Random Access Memory, is a type of computer memory that stores each bit of data in a separate capacitor within an integrated circuit. Unlike static RAM (SRAM), which uses latches to store bits, DRAM needs to be refreshed thousands of times per second because the electrical charge in the capacitors leaks away over time. The concept behind DRAM involves a dynamic storage mechanism where data needs to be continually refreshed to maintain its integrity, making it a cost-effective choice for main memory in computers.

---

## Dominierende Programmiersprachen

- [C-Programmiersrache](../Softwareentwicklung/C/index.md)
- [Embedded Rust](../Softwareentwicklung/Rust/Embedded%20Rust.md)
- [Assembly](Architekturen/Assembly.md)







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
title: Interrupts
---

# Interrupts

Interrupts in a microcontroller are mechanisms that temporarily halt the normal program execution to address urgent tasks or events. When an interrupt occurs, the processor shifts its focus to handle the interrupt service routine (ISR), which is a specific code designed to manage the interrupt. This concept allows microcontrollers to efficiently respond to external stimuli or time-sensitive events without constantly polling or waiting, enhancing overall system responsiveness and efficiency. The goal is to quickly react to external events. Order: external event, cpu completes current instruction, task is interrupted, pointer is saved on stack, ISR is executed, ISR is completed, resume with task with pointer from stack. ISR can not be interrupted, typically. ISRs are mostly short and involved gathering or processing data.

## Interrupt Service Routing - ISR

An Interrupt Service Routine (ISR) in a microcontroller is a specialized function that responds to interrupts, which are signals that temporarily halt the normal program execution. The ISR is designed to handle specific events or conditions, allowing the microcontroller to quickly address critical tasks, such as responding to external stimuli or processing time-sensitive inputs. The concept behind an ISR involves providing a rapid and focused response to interrupts, ensuring efficient handling of priority tasks without disrupting the main program flow. Tasks: Save context of current code, disable interrupts, rund code to process interrupt, restore data of interrupted code, enable interrupts, return to interrupted code

## Nested Vectored Interrupt Controller - NVIC

A Nested Vector Interrupt Controller (NVIC) is a hardware component in microcontrollers that manages interrupts in a hierarchical, or nested, structure. It allows the processor to prioritize and handle multiple interrupt requests simultaneously. The concept involves organizing interrupts in a priority hierarchy, where higher-priority interrupts can interrupt lower-priority ones. This ensures efficient and timely response to various events in a microcontroller system. It can also enable and disable interrupts based on system state und it is typically located near or on the CPU.

## Non Interrupting Polling

Polling in the context of computing involves repeatedly checking or querying a device or condition to determine its status or readiness. The concept behind polling is a continuous loop where a program or system regularly checks if a specific event or condition has occurred. For example, in input/output operations, a program may poll a device to see if new data is available or if a task is completed. Polling is a straightforward method but can be less efficient than alternatives like interrupts since it requires constant checking, potentially leading to increased processor usage.

The main difference between polling and interrupts lies in how a system or microcontroller handles external events or device status checks. Polling involves the continuous querying or checking of the status of a device by the system or microcontroller at regular intervals. In contrast, interrupts rely on a mechanism where external devices or peripherals send signals to the microcontroller to interrupt its normal operation and alert it to the need for attention. Polling is simpler to implement but may lead to higher CPU usage, as the microcontroller spends time actively checking the status. On the other hand, interrupts are more efficient because the microcontroller can focus on other tasks until it receives a signal indicating that a specific event has occurred, allowing for a more responsive and resource-efficient system. Interrupts: fast response to events, more cpu power needed, especially for many small tasks. Polling: predetermined load of CPU, derministic response time and selection of polling interval possible
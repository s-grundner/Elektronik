---
tags:
aliases:
  - Preemptive Scheduling
keywords:
  - Scheduling Algorithms
  - Preemtive Scheduling
subject:
  - VL
  - Networked Embedded Systems
semester: WS25
created: 5th January 2026
professor:
  - Alois Zoitl
release: false
title: Task Scheduling
---

# Task Scheduling

 In summary, offline scheduling sets the schedule before execution, while online scheduling adjusts the schedule dynamically during runtime to respond to changing conditions.
 
## Offline Scheduling

In microcontroller systems, offline scheduling is a pre-runtime process where task priorities and execution timings are determined beforehand. It's a static scheduling approach where the schedule remains fixed during execution. This method is suitable for applications with predictable and known task behavior. The advantage is that it is optimal due to global view of all tasks. The the disadvantage is that it is inflexible to disturbances, variablility and changes.

## Online Scheduling

On the other hand, online scheduling, also known as dynamic scheduling, involves adjusting task priorities and schedules during runtime based on real-time conditions or events. This flexibility allows the system to adapt to changing workloads or unforeseen events, making it more responsive. However, the dynamic nature of online scheduling can introduce additional computational overhead. So there has to be a compromise between scheduling effort and quality of scheduling. The scheduling desicion costs processing power, but is flexible with variability, changes and faults.

## Preemtive Scheduling

Preemptive Scheduling is a task scheduling strategy in which the operating system can interrupt an ongoing task to start or resume another task with higher priority. The concept involves dynamically allocating CPU time to tasks based on their priorities, allowing the system to respond promptly to high-priority events. This ensures that time-critical processes can be executed as needed, enhancing responsiveness in real-time systems. It also requires memory to store the data of the interrupted task (also takes time).

## Non-Preemtive Scheduling

Non-preemptive scheduling, is a scheduling strategy where a running task cannot be forcibly interrupted by the operating system. Instead, tasks voluntarily yield control to the scheduler. The concept involves relying on the cooperation of tasks to release the CPU, allowing other waiting tasks to execute. This approach is simpler to implement but may lead to inefficient resource utilization if a task monopolizes the CPU and does not voluntarily yield control.

## Scheduling Algorithms

### EDF - Earliest Deadlines First

EDF means Earliest Deadline First. This is a dynamic priority assinging algorithm for tasks in a microcontroller for example. In the ideal case (with unlimited CPU computing power), the best result can be achieved with this, but it costs a lot of computing power. So there is a lot of schduling effort, but also a higher scheduling qulity can be achieved. The task with the next absolute remaining response time gets the highest priority. So if task B needs to be finished before task A, Task B gets a higher priority. Higher priority tasks interrupt taskts with lower priority. Tasks with a short time until the next execution, will have a higher priority. 

### RMS - Rate Monotonic Scheduling

RMS means Rate Monotonic Scheduling. This is a static algorithm of assinging priorities to tasks on a microcontroller for example. There is a low scheduling effort, because the order of processing is computed simply by comparison of the priority value. The priority is assigned according to the task cycle time, so shorter cycle time means higher priority and higher priority tasks interrupt low priority tasks. The big problem with RMS is, that there is no influence on tasks with shoerter cycle time, even if other tasks do not meet their requirements (finish in a specific time).

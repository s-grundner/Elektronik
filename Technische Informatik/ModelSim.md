---
tags: 
aliases: 
keywords: 
subject:
  - Hardwaredesign
  - PR
semester: WS24
created: 14. Oktober 2024
professor:
---
 
# ModelSim

## Do-File

```do
vlib work
vmap work work

vcom -work work [*.vhd]
vsim work.[TestBench.vhd]


```
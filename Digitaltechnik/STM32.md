---
tags: ["Microcontroller"]
aliases: []
created: 18th August 2023
---

# STM32

## Projekt Setup in STMCubeIDE

> [!info]- Projektdatei Erstellen
> 
> ![](assets/CreateNewProjSTM32.png)

> [!info]- MCU Auswählen (Hier *STM32F405RGT6*)
> Nach dem Erstellen der Projektdatei öffnet sich der ***MCU-Selector***
> 
> ![](assets/MCU-Sel-STM32.png)
> 
> Hier kann entweder direkt nach einer Part-Nummer gesucht werden, oder nach Eigenschaften und Peripherien gefiltert werden.

> [!info]- Projektoptionen und Fertigstellung
> 
> ![InlineR|381](assets/STM32-Proj_Opt.png)
> 
> Für den Einstig können hier die Standardeinstellungen verwendet werden.
>
> *Targeted Language:* Grundsätzlich ist für STM32 Projekte die Programmiersprache C empfohlen. Habe ich zwar nicht selbst ausprobiert, aber für C++ soll es anscheinend Probleme mit dem HAL geben.
> 
> *Executable:* Das Programm ist auf dem MCU Ausführbar.
> 
> Anschließend mit *Finish* das Projekt Setup beenden.

## Requirements

STMCubeIDE
[STLink Server](https://www.st.com/en/development-tools/st-link-server.html)

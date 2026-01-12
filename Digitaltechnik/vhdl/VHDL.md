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
 

# VHDL


Bei der Simulation (z.B. mit ModelSim oder GHDL):

1. VHDL lädt alle Architektur/Entity-Definitionen.
2. Simulation startet bei Zeit = 0 ns.
3. Alle Prozesse, die _sensitive_ auf initiale Werte sind, laufen.
4. Signalzuweisungen erzeugen neue Events.
5. Diese führen zu weiteren Prozessaktivierungen 
6. Die Simulation geht in der Zeit weiter, wenn keine Ereignisse mehr innerhalb eines Delta-Zyklus auftreten.
    

VHDL behandelt Signaländerungen wie Events in einem **Ereigniskalender**.

## Delta Zyklen

VHDL ist eine **ereignisgesteuerte** Sprache. Änderungen an Signalen geschehen **nicht sofort**, sondern **am Ende eines Simulationsschritts**, eventuell mit Verzögerung von sogenannten **Delta-Zyklen**.

Ein **Delta-Zyklus** ist ein infinitesimal kleiner Zeitschritt (`0 ns`), der genutzt wird, um **rechenlogische Veränderungen ohne Zeitverzögerung** zu simulieren.

**Ablauf:**

1. Prozess wird aktiviert durch ein Ereignis (z.B. Signaländerung).
    
2. Signalzuweisungen (`<=`) werden vorgemerkt.
    
3. Am Ende des Delta-Zyklus werden die neuen Signalwerte übernommen.
    
4. Falls sich dadurch etwas ändert, starten andere abhängige Prozesse erneut – und das ggf. in mehreren Delta-Zyklen, **innerhalb desselben Zeitschritts.**

## HDL vs. Prozedurale Programmiersprache

| Merkmal         | VHDL                                                         | C                                             |
| --------------- | ------------------------------------------------------------ | --------------------------------------------- |
| Zweck           | Hardwarebeschreibung (Schaltkreise)                          | Softwarebeschreibung (Algorithmik)            |
| Nebenläufigkeit | **Nebenläufig** (alle Prozesse laufen „gleichzeitig“)        | **Sequenziell** (Befehle laufen nacheinander) |
| Zeitmodell      | Simulationszeit, Delta-Zyklen                                | Keine eingebaute Zeitlogik                    |
| Datenhaltung    | Signale, die reale Drähte/Flipflops modellieren              | Speicherwerte im RAM                          |
| Struktur        | Hierarchische Modellierung von Hardware (Komponenten, Ports) | Funktionen, Structs, Stack/Heap               |

## Signal vs. Variable

| Eigenschaft    | `signal`                                                                    | `variable`                                  |
| -------------- | --------------------------------------------------------------------------- | ------------------------------------------- |
| Sichtbarkeit   | global oder innerhalb von Prozessen                                         | nur innerhalb von Prozessen oder Funktionen |
| Aktualisierung | **nach** dem Prozess (am Ende des Simulator-Zyklus, evtl. mit Delta-Zyklus) | **sofort** innerhalb des Prozesses          |
| Verwendung     | Modelliert echte Verbindungen zwischen Komponenten                          | Zwischenspeicher innerhalb von Prozessen    |
## Register Prozesse

> [!important] Register und Kombinatorikprozesse trennen!
> 
> - **Kombinatorik:** *alle* inputs außer `clk_i` und `reset_i` in der Sensitivity List
> - **Register:** nur `clk_i` und `reset_i` in der Sensitivity List

> [!warning] Niemals benötigt man `clk_i` und `reset_i` in einem kombinatorischen Prozess

## Inferred Latches

> [!warning] Inferred Latches:
> Wenn ein Signal in einem Prozess nicht in jedem Fall zugewiesen wird, wird es zu einem Latch

```vhdl title="Latch❌"
reg_seq : process(clk_i, rst_i) is
begin
    if rst_i = '1' then
        hold_value_o <= (others => '0');
    elsif rising_edge(clk_i) then
        hold_value_o <= hold_value;
    end if;
end process reg_seq;

hold_comb : process(strb_i, value_i) is
begin
    if strb_i = '1' then
        hold_value <= resize(value_i, 16);
    end if;
end process hold_comb;
```

> [!success] Immer mit `next` signalen Arbeiten (Dienen als Speicher und implizieren ein Register)

```vhdl title="Register / D-Flip-Flops✅"
reg_seq : process(clk_i, rst_i) is
begin
    if rst_i = '1' then
        hold_value_o <= (others => '0');
    elsif rising_edge(clk_i) then
        hold_value <= next_hold_value;
    end if;
end process reg_seq;

hold_comb : process(strb_i, value_i) is
begin
    next_hold_value <= hold_value; -- Default value, if strb_i = '0'
    if strb_i = '1' then
        next_hold_value <= resize(value_i, 16);
    end if;
end process hold_comb;

hold_value_o <= hold_value;
```
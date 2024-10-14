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



> [!important] Register- und Kombinatorikprozesse trennen!
> 
> - **Kombinatorik:**  *alle* inputs außer `clk_i` und `reset_i` in der Sensitivity List
> - **Register:** nur `clk_i` und `reset_i` in der Sensitivity List

> [!warning] Niemals benötigt man `clk_i` und `reset_i` in einem kombinatorischen Prozess

## FSM in VHDL

```vhdl
fsm_combinatoric : process (start_button_i, counter_value_i, blink_fsm_state) is
begin
    next_blink_fsm_state <= blink_fsm_state; -- Standard zuweisung: alten State übernehmen
    ...
    case blink_fsm_state is
        when START =>
            if ... then
                ...
                next_blink_fsm_state <= ...; -- Neuer State
            end if;
        when WAIT_2s =>
            if ... then
                ...
                next_blink_fsm_state <= ...;
            end if;
        when LED_ON =>
            if ... then
                ...
                next_blink_fsm_state <= ...;
            end if;
        when others => next_blink_fsm_state <= START;
    end case;
end process;
```

## Strobe Sigale

Sind nur für eine Clock Periode 1


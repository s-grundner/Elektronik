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

> [!important] Registerund Kombinatorikprozesse trennen!
> 
> - **Kombinatorik:** *alle* inputs außer `clk_i` und `reset_i` in der Sensitivity List
> - **Register:** nur `clk_i` und `reset_i` in der Sensitivity List

> [!warning] Niemals benötigt man `clk_i` und `reset_i` in einem kombinatorischen Prozess

## Entity / Architecture

```vhdl title="entity"
entity ...
```

```vhdl title="architecture"

```

## Clock Generierung

```vhdl
clk_gen :  process(tb_clk) is
begin
    tb_clk <= not tb_clk after 1 ns; -- 500MHz Clock
end process clk_gen
```

## FSM in VHDL

```vhdl title="Finite State Machine"
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
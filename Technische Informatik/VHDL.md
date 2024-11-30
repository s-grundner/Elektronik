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

> [!important] Register und Kombinatorikprozesse trennen!
> 
> - **Kombinatorik:** *alle* inputs außer `clk_i` und `reset_i` in der Sensitivity List
> - **Register:** nur `clk_i` und `reset_i` in der Sensitivity List

> [!warning] Niemals benötigt man `clk_i` und `reset_i` in einem kombinatorischen Prozess

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

Immer mit `next` signalen Arbeiten (Dienen als Speicher und implizieren )

```vhdl title="D-Flip-Flop✅"
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
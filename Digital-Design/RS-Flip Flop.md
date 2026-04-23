## RS-Flip Flop

> [!question] [Sequenzielle Logik](Sequenzielle%20Logik.md)

Eingänge: 

- $S$: Zustand setzen (Set)
- $R$: Zustand rücksetzen (Reset)

Ausgänge

- $Q$: Ausgang
- $\neg Q$: Negierter Ausgang

> [!error] Nachteile des RS-FlipFlop
> 
> - Beim Speichern eines Wertes 0 oder 1 muss man den Wert kennen!
> - Verbotener Zustand möglich.
> - Ziel: Speichern unbekannter Werte

### Schaltung mit NOR-Gattern

![invert_dark|400](../_assets/Pasted%20image%2020260415145018.png)


| $S$ | $R$ | $Q_{t+1}$ | $\neg Q_{t+1}$ | Verhalten  |
| --- | --- | --------- | -------------- | ---------- |
| 1   | 0   | 1         | 0              | Setzen     |
| 0   | 0   | $Q_{t}$   | $\neg Q_{t}$   | Speichern  |
| 0   | 1   | 0         | 1              | Rücksetzen |
| 1   | 1   | ?         | ?              | ?          |


### Schaltung mit NAND-Gattern

![invert_dark|400](../_assets/Pasted%20image%2020260415145532.png)

| $S$ | $R$ | $Q_{t+1}$ | $\neg Q_{t+1}$ | Verhalten  |
| --- | --- | --------- | -------------- | ---------- |
| 0   | 1   | 1         | 0              | Setzen     |
| 1   | 1   | $Q_{t}$   | $\neg Q_{t}$   | Speichern  |
| 1   | 0   | 0         | 1              | Rücksetzen |
| 0   | 0   | ?         | ?              | ?          |


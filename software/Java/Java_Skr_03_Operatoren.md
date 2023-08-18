
3 Operatoren
====================

In JAVA verfügbare Operatoren:

| Operator |             Bedeutung             |       Beispiel        |    Ergebnis     |
| :------: | :-------------------------------: | :-------------------: | :-------------: |
|    +     |  Positive Vorzeichen / Addition   |  a = +1; x = 1 + 2;   |  a= 1; x = 3;   |
|    -     | Negative Vorzeichen / Subtraktion |      x = 3 – 2;       |     x = 1;      |
|    *     |          Multiplikation           |      x = 2 * 3;       |     x = 6;      |
|    /     |             Division              |      x = 7 / 3;       |     x = 2;      |
|    %     |              Modulo               |      x = 7 % 3;       |     x = 1;      |
|    ++    |        Prä-/Post-Inkrement        |      x++;  ++x;       |   x = x + 1;    |
|    --    |        Prä-/Post-Dekrement        |         x--;          |   x = x – 1;    |
|    ==    |             Vergleich             |     x = (2 == 3);     |   x = false;    |
|    <     |              Kleiner              |     x = (2 < 2);      |   x = false;    |
|    <=    |          Kleiner gleich           |     x = (2 <= 2);     |    x = true;    |
|    >     |              Größer               |     x = (2 > 2);      |   x = false;    |
|    >=    |           Größer gleich           |     x = (2 >= 2);     |    x = true;    |
|    !=    |             Ungleich              |     x = (2 != 2);     |   x = false;    |
|    !     |          Logisches NICHT          |      x = !true;       |   x = false;    |
|    \|    |           Bitweise ODER           |      x = 3 \| 7;      |     x = 7;      |
|    \|    |         Logisches ODER *)         |  x = true \| false;   |    x = true;    |
|   \|\|   | Logisches ODER (short circuit) *) | x = true \|\| false;  |    x = true;    |
|    &     |           Bitweise UND            |      x = 3 & 7;       |     x = 3;      |
|    &     |         Logisches UND *)          |   x = true & false;   |   x = false;    |
|    &&    | Logisches UND (short circuit) *)  |  x = true && false;   |   x = false;    |
|    ^     |           Bitweise EXOR           |      x = 3 ^ 7;       |     x = 4;      |
|    >>    |   Rechtsschieben mit Vorzeichen   |     x = -12 >> 2;     |     x = -3;     |
|   >>>    |  Rechtsschieben ohne Vorzeichen   | x = 0xFFFFFFFF >>> 2; | x = 0x3FFFFFFF; |
|    <<    |   Linksschieben mit Vorzeichen    |     x = -3 << 2;      |    x = -12;     |
|   <<<    |   Linksschieben ohne Vorzeichen   | x = 0xFFFFFFFF <<< 2; | x = 0xFFFFFFFC; |
|    ~     |          Einerkomplement          |      x = ~0x100;      | x = 0xFFFFFEFF; |
|    =     |        Zuweisungsoperator         |        x = 3;         |     x = 3;      |
|   *x*=   |        Rechenzuweisung **)        |        x += 3;        |   x = x + 3;    |
| (*type*) |        Typ-Umwandlung ***)        |     x = (int)3L;      |     x = 3;      |

\*) für die Operatoren UND und ODER gibt es jeweils auch sogenannte Short-Circuit-Varianten: dabei wird der zweite Term der Verknüpfung nur dann ausgeführt wenn der erste Term wahr ist.
\*\*) *x* kann einer der folgenden Operatoren sein +, -, *, /, %, |, &, ^, ~, <<, <<<, >>, >>>.
***) *type* kann ein beliebiger primitiver Datentyp sein.

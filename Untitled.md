
$$
\text{Für positive } a_1,\dots,a_n \text{ zeige man } \left(\sum_{i=1}^n a_i\right) \cdot \left(\sum_{i=1}^n a_i^{-1}\right) \geq n^2. \text{ Wann gilt Gleichheit?}
$$

$$
\text{Um die Ungleichung } \left(\sum_{i=1}^n a_i\right) \cdot \left(\sum_{i=1}^n a_i^{-1}\right) \geq n^2 \text{ zu zeigen, verwenden wir die Cauchy-Schwarz-Ungleichung.}

\text{Die Cauchy-Schwarz-Ungleichung besagt für zwei Vektoren } \mathbf{u} = (u_1, u_2, \dots, u_n) \text{ und } \mathbf{v} = (v_1, v_2, \dots, v_n) \text{ im } \mathbb{R}^n:

\[ \left(\sum_{i=1}^n u_i v_i\right)^2 \leq \left(\sum_{i=1}^n u_i^2\right) \cdot \left(\sum_{i=1}^n v_i^2\right) \]

\text{Setzen wir } u_i = \sqrt{a_i} \text{ und } v_i = \frac{1}{\sqrt{a_i}}, \text{ so erhalten wir:}

\[ \left(\sum_{i=1}^n \sqrt{a_i} \cdot \frac{1}{\sqrt{a_i}}\right)^2 \leq \left(\sum_{i=1}^n (\sqrt{a_i})^2\right) \cdot \left(\sum_{i=1}^n \left(\frac{1}{\sqrt{a_i}}\right)^2\right) \]

\text{Das vereinfacht sich zu:}

\[ \left(\sum_{i=1}^n 1\right)^2 \leq \left(\sum_{i=1}^n a_i\right) \cdot \left(\sum_{i=1}^n a_i^{-1}\right) \]

\text{Das ist genau die gewünschte Ungleichung } \left(\sum_{i=1}^n a_i\right) \cdot \left(\sum_{i=1}^n a_i^{-1}\right) \geq n^2 \text{.}

\text{Die Gleichheit tritt in der Cauchy-Schwarz-Ungleichung nur dann auf, wenn die Vektoren } \mathbf{u} \text{ und } \mathbf{v} \text{ linear abhängig sind. Das bedeutet, dass es eine Konstante } c \neq 0 \text{ gibt, so dass } c \mathbf{u} = \mathbf{v}. \text{ In unserem Fall bedeutet das:}

\[ c \sqrt{a_i} = \frac{1}{\sqrt{a_i}} \]

\text{Multiplizieren wir beide Seiten mit } \sqrt{a_i}, \text{ erhalten wir } c \sqrt{a_i^2} = \frac{1}{\sqrt{a_i}}. \text{ Da } a_i \text{ positiv ist, können wir die Wurzel ziehen und es ergibt sich } c a_i = \frac{1}{\sqrt{a_i}}. \text{ Nun multiplizieren wir beide Seiten mit } a_i, \text{ um } c a_i^2 = \frac{1}{\sqrt{a_i}} \text{ zu erhalten. Da } c \text{ konstant ist, muss } c a_i^2 \text{ für alle } i \text{ gleich sein. Setzen wir dies in die Gleichung ein:}

\[ c \sum_{i=1}^n a_i^2 = \sum_{i=1}^n \frac{1}{\sqrt{a_i}} \]

\text{Da } c \text{ konstant ist, können wir es aus der Summe herausziehen:}

\[ c \sum_{i=1}^n a_i^2 = c \sum_{i=1}^n \frac{1}{\sqrt{a_i}} \]

\text{Teilen wir nun beide Seiten durch } c, \text{ erhalten wir:}

\[ \sum_{i=1}^n a_i^2 = \sum_{i=1}^n \frac{1}{\sqrt{a_i}} \]

\text{Das bedeutet, dass Gleichheit in der Cauchy-Schwarz-Ungleichung genau dann auftritt, wenn die Quadrate der } a_i \text{ proportional zu den Kehrwerten der } \sqrt{a_i} \text{ sind.}
$$
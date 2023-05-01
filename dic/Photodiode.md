![[Pasted image 20230501142623.png|1000]]

## AD Wandler initialisieren
- PA3 = ADC3
- $V_{ref}$ = 5V
- 10-bit Auflösung

![[Pasted image 20230501160156.png]]
$$
\tfrac{16MHZ}{PS}\rightarrow200kHz - 50kHz

$$

```c
void adc_init()
{
	// ADMUX |= PA3;
	ADMUX |= (1<<MUX1)|(1<<MUX0);
	ADMUX &= ~((1<<MUX4)|(1<<MUX3)|(1<<MUX2));
	// ADLAR = 0
	ADMUX &= ~(1<<ADLAR);
	// AVCC = 5V Referenzspannung
	ADMUX |= (1<<REFS0);
	ADMUX &= ~(1<<REFS1);
	// Prescaler 128
	ADCSRA |= (1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0);
	ADCSRA |= (1<<ADEN); // ADC einschalten
	ADCSRA |= (1<<ADSC); // erste Konversion Starten
}
```

$$
\begin{align*}
1 \tfrac{mW}{cm^{2}} &\rightarrow 0.1V\\
10 \tfrac{mW}{cm^{2}} &\rightarrow 4V\\
\end{align*}
$$
$$
ed(U) = k\cdot U + d \rightarrow
\begin{align*}
k &= \tfrac{30}{13} \\
d &= \tfrac{10}{13}
\end{align*}
$$
$$
U = ADC \cdot \dfrac{5}{1024}
$$
$$
\begin{align*}
ed(U) &= \tfrac{30}{13}\cdot\tfrac{5}{1024} \cdot ADC + \tfrac{10}{13}\\
&= \tfrac{75}{6656} \cdot ADC + \tfrac{10}{13}
\end{align*}
$$

```c
#define SENSOR_K (75.0/6656.0)
#define SENSOR_D (10.0/13.0)
char check_sensor()
{
	while(ADCSRA & (1<<ADSC));                                // Warten bis Konversation fertig ist
	float energy_density = (float) ADC * SENSOR_K + SENSOR_D; // Sensorgleichung
	ADCSRA |= (1<<ADSC);                                      // ADC Restarten
	return (energy_density > 7.0) - (energy_density < 3.0);   // return code (man konn a if macha, wenn ma langweilig is)
}

int main()
{
	adc_init();
	char cool = check_sensor();
	while(1);
}
```

### ADLAR
```c
// -----| 10-Bit |------
// ADLAR = 0 -> COOL
short adv_val = ADCL;
adc_val |= (ADCH << 8)

// ADLAR = 1 -> UNCOOL
short adc_val2 = ADCL >> 6;
adc_val2 |= ADCH << 2;
// hhhhhhhh ll000000 
// <<2      >>6  

// -----|  8-Bit |------
// ADLAR = 1 -> COOL
char adc8 = ADCH;

```
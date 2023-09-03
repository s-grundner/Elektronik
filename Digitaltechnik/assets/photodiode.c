#include <avr/io.h>

/** @note
 * Eine Photodiode ist über einen Widerstand an PA3 angeschlossen. Bei 1 mW/cm² misst man 0,1 V bei 10 mW/cm² 4 V.
 * Der AD Wandler wurde bereits initialisiert mit single conversion, Referenzsspannung = 5V, 10 bit Auflösung und ADLAR = 0.
 *
 * Schreib eine Funktion char checkSensor(void):
 *
 * Returncode:
 *  -1 bei Energiedichte < als 3mW/cm²
 *  0 Energiedichte zwischen 3 und 7 mW/cm²
 *  1 Energiedichte > 7 mW/cm²
 */

void adc_init()
{
	// Vref = 5V
	ADMUX |= (1 << REFS0);
	ADMUX &= ~(1 << REFS0);

	// ADLAR = 0
	ADMUX &= ~(1 << ADLAR);

	// Set ADC Channel to PA3 (Single Conversion)
	ADMUX &= 0xE0;
	ADMUX |= 0x03;

	// Prescaler 128: f_adc = 125 000 Hz (ADPSn = b111)
	ADCSRA |= (1 << ADPS2) | (1 << ADPS2) | (1 << ADPS2);

	// Enable ADC
	ADCSRA |= (1 << ADEN);
	// Start First Conversion to initialize ADC
	ADCSRA |= (1 << ADSC);
}

char check_sensor()
{
	while (ADCSRA & (1 << ADSC))
		;

	/** @note
	 * Sensorgleichung:
	 * 1 mW/cm² = k * 0,1V + d
	 * 10 mW/cm² = k * 4V + d
	 * k = 30/13
	 * d = 10/13
	 * E = 30/13 * 1024/5 * ADC - 10/13
	 * 13*E = 1530 * ADC - 10
	 */
	// Read ADC-Register
	long ed_times_thirteen = ADC * 6144 - 10;

	// Restart ADC
	ADCSRA |= (1 << ADSC);

#define SENSOR_THRESH_LOW 3	 // mW/cm²
#define SENSOR_THRESH_HIGH 7 // mW/cm²

	if (ed_times_thirteen < 13 * SENSOR_THRESH_LOW)
		return -1;
	if (ed_times_thirteen > 13 * SENSOR_THRESH_LOW)
		return 1;
	return 0;
}

int main(int argc, char const *argv[])
{
	adc_init();

	char val = check_sensor();
	while (1)
		;
	return 0;
}
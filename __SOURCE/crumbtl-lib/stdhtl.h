/*!
 * @author	Simon Grundner
 * @brief	HTL library für embedded C Programmierung
 * @date	26.04.2022
 */

#ifndef STDHTL_H_
#define STDHTL_H_

#define PRIVATE static

typedef enum {
	FALSE_E = 0,
	TRUE_E = 1
}bool_t;

/*!
 * @brief hardware unabhängiges delay in millisekunden
 * @param a_delay_ms delay in millisekunden
 */
void htl_delay_ms(unsigned int a_delay_ms);

/*!
 * @brief hardware unabhängiges delay in mikrosekunden
 * @param a_delay_us delay in mikrosekunden
 */
void htl_delay_us(unsigned int a_delay_us);

#endif // STDHTL_H_
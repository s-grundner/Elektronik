/*!
 * @author Simon Grundner
 * @brief Ringbuffer library
 * @date 26.04.2022
 */ 

#ifndef RINGBUFFER_H_
#define RINGBUFFER_H_
#include "stdhtl.h"

typedef struct ringbuffer_s *ringbuffer_t;

/*!
 * @brief alloziiert einen neuen ringbuffer
 * @param size größe des ringbuffers in byte
 */
ringbuffer_t ringbuffer_create(unsigned char size);

/*!
 * @brief free() buffer und den rinbuffer selbst
 * @param rb ringbuffer, der zerstört werden soll
 */
void ringbuffer_destroy(ringbuffer_t rb);

/*!
 * @brief schreibt einen neuen wert in den nächsten freien slot in der ringbuffer queue
 * @param rb ringbuffer, auf den geschrieben werden soll
 */
bool_t ringbuffer_write(ringbuffer_t rb, unsigned char data);

/*!
 * @brief liest den nächsten ringbuffer wert aus
 * @param rb ringbuffer, von dem gelesen werden soll
 */
bool_t ringbuffer_read(ringbuffer_t rb, unsigned char *data)

#endif // RINGBUFFER_H_
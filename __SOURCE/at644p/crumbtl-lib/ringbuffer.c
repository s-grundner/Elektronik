#include "ringbuffer.h"
#include <avr/io.h>
#include <stdlib.h>

/*!
 * @struct	ringbuffer_s
 * @brief	structure für den ringbuffer
 * @param 	size	größe des ringbuffers
 * @param	r_index	position an der als nächstes gelesen werden soll
 * @param	w_index position an der als nächstes geschrieben werden soll
 * @param	buffer	datenarray
 */
struct ringbuffer_s
{
	unsigned char size;
	unsigned char r_index;
	unsigned char w_index;
	unsigned char *buffer;
};

ringbuffer_t ringbuffer_create(unsigned char size)
{
	ringbuffer_t ringbuffer = calloc(1, sizeof(*ringbuffer)); // 1 ... anzahl an ringbuffer
	if (ringbuffer == 0) return 0; // no memory

	ringbuffer->buffer = malloc(size); // speicher für den buffer reservieren
	if(ringbuffer->buffer == 0) // no memory
	{
		ringbuffer_destroy(ringbuffer);
		return 0;
	}
	ringbuffer->size = size;
	return ringbuffer;
}

void ringbuffer_destroy(ringbuffer_t rb)
{
	if(rb->buffer) free(rb->buffer); // wenn rb noch nicht leer ist, erst den buffer leeren
	free(rb);
}

bool_t ringbuffer_write(ringbuffer_t rb, unsigned char data)
{
	unsigned char w_index = rb->w_index;
	w_index = (w_index+1) % rb->size; // write index inkrementieren und im bereich der queue bleiben.

	if(w_index == rb->r_index) return FALSE_E; // Ringbuffer ist voll
	rb->buffer[w_index] = data;

	rb->w_index = w_index;
	return TRUE_E;
}

bool_t ringbuffer_read(ringbuffer_t rb, unsigned char *data)
{
	unsigned char r_index = rb->r_index;

	if(r_index == rb->w_index) return FALSE_E; // Es wurde noch nichts geschreiben
	*data = rb->buffer[rb->r_index];

	r_index = (r_index+1) % rb->size; // read index inkrementieren und im bereich der queue bleiben.
	rb->r_index = r_index;
	return TRUE_E;
}
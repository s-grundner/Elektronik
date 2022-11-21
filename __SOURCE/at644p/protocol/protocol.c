
#include "protocol.h"

unsigned char ip_checksum(unsigned char *data, int data_len)
{
	unsigned char checksum = 0;
	unsigned char data_arr[2] = {*data, 0x07};
	for (int i = 0; i < data_len; i++)
	{
		checksum += ~data_arr[i];
	}
	return ~checksum;
}

void encrypt(unsigned char* data_in, unsigned char* encrypted, int len, unsigned char key)
{
	for (int i = 0; i < len; i++)
	{
		(*encrypted) = (*data_in)^key;
		data_in++;
		encrypted++;
	}
}

void decrypt(unsigned char* encrypted, unsigned char* data_out, int len, unsigned char key)
{
	for (int i = 0; i < len; i++)
	{
		(*data_out) = (*encrypted)^key;
		data_out++;
		encrypted++;
	}
}

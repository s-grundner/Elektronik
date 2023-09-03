#ifndef MISC_H_
#define MISC_H_

unsigned char ip_checksum(unsigned char*, int);
void encrypt(unsigned char* data_in, unsigned char* encrypted, int len, unsigned char key);
void decrypt(unsigned char* encrypted, unsigned char* data_out, int len, unsigned char key);

#endif
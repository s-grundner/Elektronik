#include "Singleton.h"

int main() {
	Singleton &s1= Singleton::getInstance();
	Singleton &s2= Singleton::getInstance();

	s1.log("S1> Hi from s1 :-)");
	s2.log("S2> Hi s1");
	Singleton::getInstance().log("> Ich mag auch mal");
	return 0;
}
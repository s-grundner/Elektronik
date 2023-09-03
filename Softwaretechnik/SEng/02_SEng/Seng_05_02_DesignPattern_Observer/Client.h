// client.h
#ifndef CLIENT_H
#define CLIENT_H

#include <iostream>
#include "Observer.h"

class Client : public Observer {
    int id;
public:
    Client(int id);
    virtual void update(float temp, float humidity, float pressure) override;
};

#endif // CLIENT_H

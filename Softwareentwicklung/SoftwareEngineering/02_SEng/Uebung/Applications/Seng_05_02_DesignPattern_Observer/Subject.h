#ifndef SUBJECT_H
#define SUBJECT_H

#include "Observer.h"

class Subject {
public:
    virtual void registerObserver(Observer *observer) = 0;
    virtual void removeObserver(Observer *observer) = 0;
    virtual void notifyObserver() = 0;
};

#endif // SUBJECT_H

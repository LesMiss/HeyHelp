#ifndef UIDGENERATOR_H
#define UIDGENERATOR_H

#include <QObject>

#include <iostream>
#include <ctime>
#include <random>
#include <stdlib.h>
#include <ctime>

class uidGenerator : public QObject
{
    Q_OBJECT
public:
    explicit uidGenerator(QObject *parent = nullptr);
    QString getUid();
    QString random(int low, int high);
    int zone1 = 22;
    int zone2 = 30;
signals:

};

#endif // UIDGENERATOR_H

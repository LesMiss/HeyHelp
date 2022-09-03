#ifndef ENCRYPTIONMESSAGES_H
#define ENCRYPTIONMESSAGES_H

#include <QObject>
#include <QDebug>
#include <mysql.h>
#include <string>
#include <iostream>
#include "../keyGeneration/keygenerator.h"
#include "../addOrCloseDataBase/connectiondatabase.h"

using namespace std;

class encryptionMessages : public QObject
{
    Q_OBJECT
public:
    explicit encryptionMessages(QObject *parent = nullptr);

signals:
    void newMessage(QString message);
public slots:
    QString onNewMessage(QString message, QString from_user_id, QString to_user_id);
};

#endif // ENCRYPTIONMESSAGES_H

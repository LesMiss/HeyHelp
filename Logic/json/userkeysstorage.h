#ifndef USERKEYSSTORAGE_H
#define USERKEYSSTORAGE_H

#include <QObject>
#include <QDebug>
#include <QFile>
#include <QVariantMap>
#include <QIODevice>

// for json
#include <QJsonDocument>
#include <QJsonParseError>
#include <QJsonObject>
#include <QJsonValue>
#include <QJsonArray>

#include <Logic/keyGeneration/keygenerator.h>
#include <iostream>
using namespace std;

class userKeysStorage : public QObject
{
    Q_OBJECT
public:
    explicit userKeysStorage(QObject *parent = nullptr);

    QString observePublicKey();
    QString observePrivateKey();


signals:

public slots:
    void saveKeysIntoJson();
    void deleteUserKeys();
};

#endif // USERKEYSSTORAGE_H

#ifndef KEYGENERATOR_H
#define KEYGENERATOR_H

#include <QObject>
#include <QDebug>
#include <vector>
#include <iostream>
#include <QTextStream>
#include <QFile>
#include <Logic/json/userkeysstorage.h>
using namespace std;

// For encryption -->
#include <cryptopp/aes.h>
#include <cryptopp/rijndael.h>
#include <cryptopp/cryptlib.h>
#include <cryptopp/eax.h>
#include <cryptopp/pem.h>

#include <cryptopp/rsa.h>
#include <cryptopp/osrng.h>
#include <string.h>
#include<fstream>
#include <cryptopp/files.h>

using namespace CryptoPP;

class keyGenerator : public QObject
{
    Q_OBJECT
public:
    explicit keyGenerator(QObject *parent = nullptr);

    QString private_key;
    QString public_key;

    RSA::PrivateKey readPrivateKeyInLocalUserFile();
    RSA::PublicKey readPublicKeyInLocalUserFile();
    void decryptMessage();
    void aesEncryption();

signals:

public slots:
    void writePublicKeyInLocalUserFile();
    void writePrivateKeyInLocalUserFile();
    string encryptMessage(std::string data);
};

#endif // KEYGENERATOR_H

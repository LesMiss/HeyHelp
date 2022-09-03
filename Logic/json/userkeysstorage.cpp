#include "userkeysstorage.h"

QFile fileJson("./first.json");
QString settings;

userKeysStorage::userKeysStorage(QObject *parent)
    : QObject{parent}
{

}


void userKeysStorage::saveKeysIntoJson()
{
    keyGenerator keys;
    fileJson.open(QIODevice::WriteOnly); //все верно, если файла нет, он будет создан
    QVariantMap testMap; //тестовые данные, может быть все, что угодно
    testMap.insert("private_key", keys.private_key);
    testMap.insert("public_key", keys.public_key);
    fileJson.write(QJsonDocument(QJsonObject::fromVariantMap(testMap)).toJson());
    fileJson.close();
}

QString userKeysStorage::observePublicKey()
{
    fileJson.open(QIODevice::ReadOnly);
    settings = fileJson.readAll();
    fileJson.close();

    QJsonDocument sd = QJsonDocument::fromJson(settings.toUtf8());
    QJsonObject sett2 = sd.object();
    QJsonValue obj = sett2.value(QString("public_key"));
//    std::string utf8_text = obj.toString().toUtf8().constData();

    return obj.toString();
}

QString userKeysStorage::observePrivateKey()
{
    fileJson.open(QIODevice::ReadOnly);
    settings = fileJson.readAll();
    fileJson.close();

    QJsonDocument sd = QJsonDocument::fromJson(settings.toUtf8());
    QJsonObject sett2 = sd.object();
    QJsonValue obj = sett2.value(QString("private_key"));
    qDebug() << obj.toString();
//    std::string utf8_text = obj.toString().toUtf8().constData();

    return obj.toString();
}

void userKeysStorage::deleteUserKeys()
{
    fileJson.open(QIODevice::WriteOnly);
    QVariantMap testMap;
    testMap.insert("private_key", "");
    testMap.insert("public_key", "");
    fileJson.close();
}



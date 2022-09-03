#ifndef USERKEYS_H
#define USERKEYS_H

#include <QObject>
#include <QSettings>
#include <QDebug>

class userKeys : public QObject
{
    Q_OBJECT
public:
    explicit userKeys(QObject *parent = nullptr);

    QString public_key;
    QString private_key;

    void writeSettings();
    void readSettings();

signals:
    void getKeys(QString privat_key, QString public_key);

};

#endif // USERKEYS_H

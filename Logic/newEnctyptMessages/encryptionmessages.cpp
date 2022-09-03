#include "encryptionmessages.h"


encryptionMessages::encryptionMessages(QObject *parent)
    : QObject{parent}
{

}

QString encryptionMessages::onNewMessage(QString message, QString from_user_id, QString to_user_id)
{
    connectionDataBase db;
    db.addConnection();
    QSqlQuery query;
    query.prepare("INSERT INTO `libUsr`.`allmsg` (`from_user_id`, `to_user_id`, `date`, `message`) "
                  "VALUES (?, ?, ?, ?)");

     /*1. from_user_id*/     query.addBindValue(from_user_id);
     /*2. to_user_id*/     query.addBindValue(to_user_id);

    // Set time and date
    QDateTime local(QDateTime::currentDateTime());
    QDateTime UTC(local);
    UTC.setTimeSpec(Qt::UTC);
    /*3. dateRegister*/ query.addBindValue(UTC.toString().toUtf8().constData());

    // Set encryption
    keyGenerator key;
    string encMessage = key.encryptMessage(message.toStdString());
    /*4. message*/ query.addBindValue(encMessage.c_str());

    return message;
}

#include "sendDataInDataBase.h"

connectionDataBase db;
getCurrentUid getCurrent;

sendDataInDataBase::sendDataInDataBase(QObject *parent)
    : QObject{parent}
{

}

void sendDataInDataBase::setInbox(QString last_message, QString participant_uid, QString unique_user_inbox)
{
    if (!db.addConnection()) { qDebug() << "setInbox: can't be writtin, becouse database has an error"; }
    QSqlQuery query;
    QString article = "'";
    // ISERTING...
    QString request = "INSERT INTO `LibertyUsers`.`inbox` (unique_user_inbox, last_message, last_sent_user_id, participant_uid) SELECT "
            + article + unique_user_inbox + "', '" + last_message + "', '" + getCurrent.readCurrentUserId() + "', '" + participant_uid + article +
            " FROM `LibertyUsers`.`users` LEFT JOIN `LibertyUsers`.`inbox` ON inbox.unique_user_inbox = users.unique_inbox ON DUPLICATE KEY UPDATE last_message = values(last_message)";
    qDebug() << request;
    query.prepare(request);
    if (!query.exec()) { qDebug() << "exec was error"; }
    db.removeConnection();
}

void sendDataInDataBase::setMessage(QString message, QString participant_uid)
{
    if (!db.addConnection()) { qDebug() << "setMessage: can't be writtin, becouse database has an error"; }
    QSqlQuery query;
    query.prepare("INSERT INTO `LibertyUsers`.`messages` (user_id, message, created_at, toId) "
                   "VALUES (:user_id, :message, :created_at, :toId)");

    /*1. user_id*/         query.bindValue(":user_id", getCurrent.readCurrentUserId());

    /*2. message */        query.bindValue(":message", message);

    // Set time and date
    QDateTime local(QDateTime::currentDateTime());
    QDateTime UTC(local);
    UTC.setTimeSpec(Qt::UTC);
    /*3. dateSendMessage*/ query.bindValue(":created_at", UTC.toString().toUtf8().constData());

    /*4. message */        query.bindValue(":toId", participant_uid);

    if (!query.exec()) { qDebug() << "exec was error"; }
    db.removeConnection();
}

//    query.prepare("INSERT INTO `LibertyUsers`.`inbox` (last_message, last_sent_user_id, participant_uid, unique_user_inbox) "
//                   "VALUES (:last_message, :last_sent_user_id, :participant_uid, :unique_user_inbox)");
//    query.prepare("INSERT INTO inbox (unique_user_inbox, last_message, last_sent_user_id, participant_uid) SELECT 'D4uxFnEFTQ6a2caYaMqfJPV214ds', 'Hi', '6', '#Lestev'  FROM `LibertyUsers`.`inbox` LEFT JOIN `libUsr`.`usr` ON inbox.unique_user_inbox = usr.unique_inbox ON DUPLICATE KEY UPDATE last_message = 'Lestev'");
//    query.prepare("INSERT INTO `LibertyUsers`.`inbox` (last_message, last_sent_user_id, participant_uid, unique_user_inbox)"

//                  " VALUES (:last_message, :last_sent_user_id, :participant_uid, :unique_user_inbox) ON DUPLICATE KEY UPDATE last_message = values(last_message)");
//    query.prepare("INSERT INTO inbox (unique_user_inbox, last_message, last_sent_user_id, participant_uid) SELECT unique_inbox FROM `LibertyUsers`.`inbox` LEFT JOIN "
//                  "`libUsr`.`usr` ON inbox.unique_user_inbox = usr.unique_inbox "
//                  "ON DUPLICATE KEY UPDATE last_message = values(last_message)");

//    query.exec("INSERT OR UPDATE `LibertyUsers`.`inbox` LEFT OUTER JOIN "
//               "`LibertyUsers`.`inbox_participants` ON usr.idusr = inbox_participants.uid LEFT OUTER JOIN "
//               "`LibertyUsers`.`inbox` ON inbox_participants.inboxID = inbox.id");
//    /*1. nickname*/     query.addBindValue(unique_user_inbox);
//    /*1. nickname*/     query.addBindValue(last_message);
//    /*1. nickname*/     query.addBindValue(getCurrent.readCurrentUserId());
//    /*1. nickname*/     query.addBindValue(participant_uid);

//    query.bindValue(":unique_user_inbox", unique_user_inbox);
//    query.bindValue(":last_message", last_message);
//    query.bindValue(":last_sent_user_id", getCurrent.readCurrentUserId());
//    query.bindValue(":participant_uid", participant_uid);

//    uidGenerator generator;
//    query.bindValue(":unique_user_inbox", unique_user_inbox);



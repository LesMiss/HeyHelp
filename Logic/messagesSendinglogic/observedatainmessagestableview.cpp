#include "observedatainmessagestableview.h"

QString id, last_message, last_sent_user_id, inboxID, uid, inbox_uid, user_id, message, created_at;

observeDataInMessagesTableView::observeDataInMessagesTableView(QObject *parent)
    : QObject{parent}
{

}

void observeDataInMessagesTableView::observeInbox()
{
    connectionDataBase db;
    db.addDB();
    QSqlDatabase inboxConnection = QSqlDatabase::database("inboxConnection");
    QSqlQuery query("SELECT * FROM inbox ", inboxConnection);
    while (query.next()) {
        id = query.value("id").toString().toUtf8().constData();
        last_message = query.value("last_message").toString().toUtf8().constData();
        last_sent_user_id = query.value("last_sent_user_id").toString().toUtf8().constData();
        qDebug() << id;
        qInfo() << last_message;
        qInfo() << last_sent_user_id;
        returnLastMessage(last_message);
        returnLastSendUserId(last_sent_user_id);
    }
    QSqlDatabase::removeDatabase("inboxConnection");
}

void observeDataInMessagesTableView::observeInboxParticipants()
{
    connectionDataBase db;
    db.addDB();
    QSqlDatabase inboxParticipantsConnection = QSqlDatabase::database("inboxParticipantsConnection");
    QSqlQuery query("SELECT * FROM inbox_participants", inboxParticipantsConnection);
    while (query.next()) {
        inboxID = query.value("inboxID").toString().toUtf8().constData();
        uid = query.value("uid").toString().toUtf8().constData();
        qDebug() << inboxID;
        qInfo() << uid;
    }
    QSqlDatabase::removeDatabase("inboxParticipantsConnection");
}

void observeDataInMessagesTableView::observeMessages()
{
    connectionDataBase db;
    db.addDB();
    QSqlDatabase messagesConnection = QSqlDatabase::database("messagesConnection");
    QSqlQuery query("SELECT * FROM messages", messagesConnection);
    while (query.next()) {
        message = query.value("message").toString().toUtf8().constData();
        inbox_uid = query.value("inbox_uid").toString().toUtf8().constData();
        user_id = query.value("user_id").toString().toUtf8().constData();
        created_at = query.value("created_at").toString().toUtf8().constData();
        qDebug() << message;
        qInfo() << inbox_uid;
        qInfo() << user_id;
        qInfo() << created_at;
    }
    QSqlDatabase::removeDatabase("messagesConnection");
}

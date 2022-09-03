#include "connectiondatabase.h"

connectionDataBase::connectionDataBase(QObject *parent)
    : QObject{parent}
{

}

bool connectionDataBase::addConnection()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL", connectionName);
    db.setHostName("127.0.0.1");
    db.setUserName("root");
    db.setPassword("Upmisha2005");
    db.setDatabaseName("LibertyUsers");
    if (!db.open()) {
        qDebug() << "Cannot open database:" << db.lastError();
        return false;
    }
    return true;
}

void connectionDataBase::addDB()
{
    QSqlDatabase dba = QSqlDatabase::addDatabase("QMYSQL");
    dba.setHostName("127.0.0.1");
    dba.setUserName("root");
    dba.setPassword("Upmisha2005");
    dba.setDatabaseName("LibertyUsers");
    if(!dba.open()){
        qDebug() << "Not Connected";
    }
}


void connectionDataBase::removeConnection()
{
    QSqlDatabase db;
    if (db.isOpen()) {
        db.close();
    }
    QSqlDatabase::removeDatabase(connectionName);
    return;
}

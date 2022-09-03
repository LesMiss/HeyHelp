#ifndef CONNECTIONDATABASE_H
#define CONNECTIONDATABASE_H

#include <QObject>
#include <QtSql>
#include <QSqlDatabase>

class connectionDataBase : public QObject
{
    Q_OBJECT
public:
    explicit connectionDataBase(QObject *parent = nullptr);
    bool addConnection();
    void removeConnection();
    void addDB();
    QString connectionName = "LibertyCompany";

private:

signals:

};

#endif // CONNECTIONDATABASE_H

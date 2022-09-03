#ifndef DATABASECONNECTIONS_H
#define DATABASECONNECTIONS_H

#include <QObject>
#include "../addOrCloseDataBase/connectiondatabase.h"
#include "../uidGenerator/uidgenerator.h"
#include "../getCurrentUid/getcurrentuid.h"

class sendDataInDataBase : public QObject
{
    Q_OBJECT
public:
    explicit sendDataInDataBase(QObject *parent = nullptr);

private:

public slots:
    void setInbox(QString last_message, QString participant_uid, QString unique_user_inbox);
    void setMessage(QString message, QString participant_uid);

signals:

};

#endif // DATABASECONNECTIONS_H

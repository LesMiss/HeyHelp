#ifndef OBSERVEDATAINMESSAGESTABLEVIEW_H
#define OBSERVEDATAINMESSAGESTABLEVIEW_H

#include <QObject>
#include "../addOrCloseDataBase/connectiondatabase.h"

class observeDataInMessagesTableView : public QObject
{
    Q_OBJECT
public:
    explicit observeDataInMessagesTableView(QObject *parent = nullptr);
signals:
    QString returnLastMessage(QString data);
    QString returnLastSendUserId(QString data);

public slots:
    void observeInbox();
    void observeInboxParticipants();
    void observeMessages();


};

#endif // OBSERVEDATAINMESSAGESTABLEVIEW_H

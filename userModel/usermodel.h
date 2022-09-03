#ifndef USERMODEL_H
#define USERMODEL_H

#include <QAbstractListModel>
#include <QUrl>

// my imports
#include <Logic/messagesSendinglogic/observedatainmessagestableview.h>
#include "Logic/json/userkeysstorage.h"
#include "Logic/uidGenerator/uidgenerator.h"
#include "Logic/addOrCloseDataBase/connectiondatabase.h"

// Roles -->
enum {
    UserName,
    UserRole,
    UserTime,
    UserAvatar,
    UserUid,
    UserId,
    UserLastMessage,
    UserLastSentUserId,
    UserNickname
};

struct tableViewList {
    QString name;
    QString avocation;
    QString time;
    QUrl avatar;
    QString uid;
    int id;
    QString last_message;
    QString last_sent_user_id;
    QString nickname;
};

class UserModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit UserModel(QObject *parent = nullptr);

    QHash<int, QByteArray> roleNames() const override;
    QVector<tableViewList> table;

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

public slots:
    void appendModel(QString nickname, QString avocation, QString name, QString time, QString password, QString img);
    void observeValue();
    QString observeKeys();

private:
};

#endif // USERMODEL_H

#include "messagemodel.h"

messagemodel::messagemodel(QObject *parent)
    : QAbstractListModel(parent)
{
//    observeValue("#A");
}

void messagemodel::observeValue(QString participant)
{
    connectionDataBase db;
    db.addDB();
    QSqlDatabase messagesConnection = QSqlDatabase::database("messagesConnection");

    QString article = "'";
    getCurrentUid uid;
    QString str = "SELECT * FROM `LibertyUsers`.`messages` WHERE user_id = "+ article + uid.readCurrentUserId() + "' and toId = '" + participant + "'";
    QSqlQuery query(str, messagesConnection);
    int count = 0;
    qDebug() << str;
    while (query.next()) {
        model.message = query.value("message").toString().toUtf8().constData();
        model.time = query.value("created_at").toString().toUtf8().constData();
        qDebug() << model.message;
        qDebug() << model.time;
        table.append(model);
        count++;
    }
    QSqlDatabase::removeDatabase("messagesConnection");

    qDebug() << count;
    beginInsertRows(QModelIndex(), 0, count - 1);
    endInsertRows();
}

void messagemodel::removeAllMsg()
{
    beginRemoveRows(QModelIndex(), 0, table.length());

    while (table.count())
         table.takeLast();
    endRemoveRows();

    qDebug() << "REmoVE" << table.count() << table.length();
}

int messagemodel::rowCount(const QModelIndex &parent) const
{
    return table.length();
}

/////////////////////////////////////////////////////////////// START REALESE /////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////// END REALESE ///////////////////////////////////////////////////////////////////////////////////


Qt::ItemFlags messagemodel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable; // FIXME: Implement me!
}

QVariant messagemodel::data(const QModelIndex &index, int role) const
{
    // FIXME: Implement me!
    const tableViewList model = table.at(index.row());

    if (!index.isValid())
        return QVariant();
    switch (role) {
    case UserMessage:
        return model.message;
    case UserTime:
        return model.time;
    return QVariant();
    }
    return QVariant();
}

QHash<int, QByteArray> messagemodel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[UserMessage] = "message";
    names[UserTime] = "time";
    return names;
}

void messagemodel::socketUpdateInDb(QString message)
{
//    model.message = message;
//    table.append(model);
//    beginInsertRows(QModelIndex(), 0, 1);
//    endInsertRows();

    // tell QT what you will be doing
    beginInsertRows(QModelIndex(), table.size(), table.size());

    // do it
    model.message = message;

    table.append(model);

    // tell QT you are done
    endInsertRows();

}

#ifndef MESSAGEMODEL_H
#define MESSAGEMODEL_H

#include <QAbstractListModel>
#include "Logic/addOrCloseDataBase/connectiondatabase.h"
#include "Logic/getCurrentUid/getcurrentuid.h"
#include <QSqlQuery>
#include <QtCore>

class messagemodel : public QAbstractListModel
{
    Q_OBJECT

// Roles -->
enum {
    UserMessage,
    UserTime
};

struct tableViewList {
    QString message;
    QString time;
};

public:
    explicit messagemodel(QObject *parent = nullptr);

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    Qt::ItemFlags flags(const QModelIndex& index) const override;
    QHash<int, QByteArray> roleNames() const override;
    QVector<tableViewList> table;
    tableViewList model;



    /////////////////////////////////////////////////////////////// START REALESE /////////////////////////////////////////////////////////////////////////////////

//        Q_INVOKABLE void addItem() {
//            qDebug() << table.length();
//            beginInsertRows(QModelIndex(), 0, rowCount() + 1);
//            endInsertRows();
//        };

//    Q_INVOKABLE void addItem() {
//        beginInsertRows(QModelIndex(), rowCount(), rowCount()+1);
//        endInsertRows();
//    };
    /////////////////////////////////////////////////////////////// END REALESE ///////////////////////////////////////////////////////////////////////////////////



signals:

private:
     QModelIndex start_index;
     QModelIndex end_index;

public slots:
    void socketUpdateInDb(QString message);
    void observeValue(QString participant);
    void removeAllMsg();
};

#endif // MESSAGEMODEL_H

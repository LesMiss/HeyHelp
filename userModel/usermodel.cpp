#include "usermodel.h"

UserModel::UserModel(QObject *parent)
    : QAbstractListModel(parent)
{
    observeValue();
}

void UserModel::observeValue()
{
    qDebug() << "asa";
    tableViewList model;
    connectionDataBase db;
    db.addDB();
    if (!db.addConnection()) { qDebug() << "model in tableView can't be writtin, becouse database has an error"; }
    QSqlQuery query;
    query.exec("SELECT * FROM `LibertyUsers`.`users` LEFT OUTER JOIN "
               "`LibertyUsers`.`inbox` ON users.nickname = inbox.participant_uid");
    while (query.next()) {
        qDebug() << "####";
        model.name = query.value("name").toString().toUtf8().constData();
        model.nickname = query.value("nickname").toString().toUtf8().constData();
        model.avocation = query.value("avocation").toString().toUtf8().constData();
        model.time = query.value("time").toString().toUtf8().constData();
        model.uid = query.value("unique_inbox").toString().toUtf8().constData();
        model.id = query.value("idusr").toInt();


        model.last_message = query.value("last_message").toString().toUtf8().constData();
        model.last_sent_user_id = query.value("last_sent_user_id").toString().toUtf8().constData();
        qDebug() << "1. is a " << model.last_message;
        qDebug() << "2. is a " << model.last_sent_user_id;
        qDebug() << "3. is a " << model.name;
        qDebug() << "4. is a " << model.nickname;
        qDebug() << "5. is a " << model.avocation;
        qDebug() << "6. is a " << model.time;
        qDebug() << "7. is a " << model.uid;
        qDebug() << "8. is a " << model.id;

        QByteArray userimage;
        userimage = query.value("avatar").toByteArray();
        QString base64 = QString::fromUtf8(userimage.toBase64());
        QString currentImage = QString("data:image/png;base64,") + base64;
        model.avatar = QUrl(currentImage);
        qDebug("success");
        table.append(model);

    }
    db.removeConnection();
}

void UserModel::appendModel(QString nickname, QString avocation, QString name, QString time, QString password, QString img)
{
    connectionDataBase db;
    db.addConnection();

    QSqlQuery query;
    query.prepare("INSERT INTO `LibertyUsers`.`users` (`nickname`, `name`, `avocation`, `time`, `password`, `dateRegister`, `avatar`, `public_key`, `unique_inbox`) "
                  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

    /*1. nickname*/     query.addBindValue(nickname);
    /*2. name*/         query.addBindValue(name);
    /*3. avocation*/    query.addBindValue(avocation);
    /*4. time*/         query.addBindValue(time);
    /*5. password*/     query.addBindValue(password);

    // Set time and date
    QDateTime local(QDateTime::currentDateTime());
    QDateTime UTC(local);
    UTC.setTimeSpec(Qt::UTC);

    /*6. dateRegister*/ query.addBindValue(UTC.toString().toUtf8().constData());

    // avatar
    QImage image;
    QByteArray arr;
    QBuffer buffer(&arr);
    image = QImage(QDir::toNativeSeparators(QUrl(img).toLocalFile()));
    buffer.open(QIODevice::WriteOnly);
    image.save(&buffer, "png");

    /*7. avatar*/       query.addBindValue(arr);

    // public key
    userKeysStorage storage;
    /*8. public_key*/   query.addBindValue(storage.observePublicKey());

    // generator uid
    uidGenerator uid;
    /*9. uid*/   query.addBindValue(uid.getUid());

    query.exec();
    db.removeConnection();

    qInfo() << nickname << avocation << password;
    cout << "data was loaded" << endl;
}

QString UserModel::observeKeys()
{
    QString public_key;
    connectionDataBase db;
    db.addConnection();
    QSqlQuery query;
    query.exec("SELECT public_key FROM usr");
    while (query.next()){
        public_key = query.value("public_key").toString();
    }

    db.removeConnection();
    return public_key;
}

int UserModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    // FIXME: Implement me!
    return table.count();
}

bool UserModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (data(index, role) != value) {
        // FIXME: Implement me!
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags UserModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable; // FIXME: Implement me!
}

QVariant UserModel::data(const QModelIndex &index, int role) const
{
    // FIXME: Implement me!
    const tableViewList model = table.at(index.row());

    if (!index.isValid())
        return QVariant();
    switch (role) {
    case UserName:
        return model.name;
    case UserRole:
        return model.avocation;
    case UserTime:
        return model.time;
    case UserAvatar:
        return model.avatar;
    case UserUid:
        return model.uid;
    case UserId:
        return model.id;
    case UserLastMessage:
        return model.last_message;
    case UserLastSentUserId:
        return model.last_sent_user_id;
    case UserNickname:
        return model.nickname;
    }
    return QVariant();
}

QHash<int, QByteArray> UserModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[UserName] = "name";
    names[UserRole] = "avocation";
    names[UserTime] = "time";
    names[UserAvatar] = "avatar";
    names[UserUid] = "uid";
    names[UserId] = "id";
    names[UserLastMessage] = "last_message";
    names[UserLastSentUserId] = "last_sent_user_id";
    names[UserNickname] = "nickname";
    return names;
}

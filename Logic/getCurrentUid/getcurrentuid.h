#ifndef GETCURRENTUID_H
#define GETCURRENTUID_H

#include <QObject>
#include <QSettings>

class getCurrentUid : public QObject
{
    Q_OBJECT
public:
    explicit getCurrentUid(QObject *parent = nullptr);

private:
    QString current_user_id;
signals:

public slots:
    QString readCurrentUserId();
    void writeSettings(QString current_uid);
    void deleteCurrentUserIdWhenSignOut();
};

#endif // GETCURRENTUID_H

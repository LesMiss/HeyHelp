#include "getcurrentuid.h"

getCurrentUid::getCurrentUid(QObject *parent)
    : QObject{parent}
{

}

void getCurrentUid::writeSettings(QString current_uid)
{
    QSettings settings("Settings", "current_uid");
    settings.setValue("current_uid", current_uid);
    settings.endGroup();
}

QString getCurrentUid::readCurrentUserId()
{
    QSettings settings("Settings", "current_uid");
    current_user_id = settings.value("current_uid").toString();
    return current_user_id;
}

void getCurrentUid::deleteCurrentUserIdWhenSignOut()
{
    //deleting
    QSettings settings("Settings", "current_uid");
    settings.clear();
}

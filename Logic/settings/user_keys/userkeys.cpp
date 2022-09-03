#include "userkeys.h"

userKeys::userKeys(QObject *parent)
    : QObject{parent}
{

}

void userKeys::writeSettings()
{
    QSettings settings("Moose Soft", "Clipper");

    settings.beginGroup("MainWindow");
    settings.setValue("geometry", "agario now");
    settings.endGroup();
    qDebug() << settings.fileName();
}

void userKeys::readSettings()
{
    QSettings settings("Moose Soft", "Clipper");

    settings.beginGroup("MainWindow");
    QString geometry = settings.value("geometry").toString();
    qDebug() << geometry;
}

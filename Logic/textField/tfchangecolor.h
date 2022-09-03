#ifndef TFCHANGECOLOR_H
#define TFCHANGECOLOR_H

#include <QObject>
#include <QDebug>

class TFChangeColor : public QObject
{
    Q_OBJECT
public:
    explicit TFChangeColor(QObject *parent = nullptr);

signals:
    void valueChanged(QString s);

public slots:
    QString changeColorOnTf(int count, bool focus, QString arg);
};

#endif // TFCHANGECOLOR_H

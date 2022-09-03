#ifndef TFONACTIVECHANGECOLOR_H
#define TFONACTIVECHANGECOLOR_H

#include <QObject>

class TFOnActiveChangeColor : public QObject
{
    Q_OBJECT
public:
    explicit TFOnActiveChangeColor(QObject *parent = nullptr);

signals:

public slots:
    QString changeColor(bool focus);
};

#endif // TFONACTIVECHANGECOLOR_H

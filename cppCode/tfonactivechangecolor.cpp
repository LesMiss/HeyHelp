#include "tfonactivechangecolor.h"

TFOnActiveChangeColor::TFOnActiveChangeColor(QObject *parent)
    : QObject{parent}
{

}

QString TFOnActiveChangeColor::changeColor(bool focus)
{
    if (focus) {
        return "#2a64f6";
    }
    return "#22232a";
}

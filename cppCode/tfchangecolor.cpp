#include "tfchangecolor.h"

TFChangeColor::TFChangeColor(QObject *parent)
    : QObject{parent}
{

}

QString TFChangeColor::changeColorOnTf(int count, bool focus, QString arg)
{
    // заменить на switch важно!!!
    if (arg == "password") {
        if (focus and count == 0) {
            return "#2a64f6";
        } else if (count <= 5 and count != 0) {
            return "#C54534";
        } else if (count <= 8 and count != 0) {
            return "#E9C26A";
        } else if (count <= 16 and count != 0) {
            return "#71F1AA";
        } else {
            return "#22232a";
        }
    } else if (arg == "") {
        if (focus and count == 0) {
            return "#2a64f6";
        } else if (count >= 1 and count != 0) {
            return "#71F1AA";
        } else {
            return "#22232a";
        }
    } else if (arg == "miniTitle"){
        if (focus and count == 0) {
            return "#00ffffff";
        } else if (count >= 1 and count != 0) {
            return "#71F1AA";
        }
    }  else if (arg == "miniTitlePassword"){
        if (focus and count == 0) {
            return "#00ffffff";
        } else if (count <= 5 and count != 0) {
            return "#C54534";
        } else if (count <= 8 and count != 0) {
            return "#E9C26A";
        } else if (count <= 16 and count != 0) {
            return "#71F1AA";
        }
    } else if (arg == "miniBack"){
        if (focus and count == 0) {
            return "#2a64f6";
        } else if (count >= 1 and count != 0) {
            return "#101116";
        } else {
            return "#22232a";
        }
    }
    return "#00ffffff";
}

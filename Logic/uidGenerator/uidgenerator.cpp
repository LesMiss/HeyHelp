#include "uidgenerator.h"

uidGenerator::uidGenerator(QObject *parent)
    : QObject{parent}
{

}

QString uidGenerator::getUid()
{
    std::string str;
    std::mt19937 gen ( time(NULL) );
    std::uniform_int_distribution <int> uid1 ( zone1, zone2 );
    int num = uid1 ( gen );
    int r;
    std::uniform_int_distribution <int> uid2 ( '0', 'z' );
    for(int i=0; i<num; i++)
    {
        do {r=uid2(gen);}while((r>'9' && r<'A') || (r>'Z' && r<'a'));
        str+=r;
    }
    std::cout << str << std::endl;
    QString result = QString::fromStdString(str);
    return result;
}

std::random_device rd;
std::mt19937 gen(rd());

QString random(int low, int high)
{
    std::uniform_int_distribution<> dist(low, high);
    QString s = QString::number(dist(gen));
    return s;
}

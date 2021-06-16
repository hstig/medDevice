#pragma once
#include <QObject>
#include <QQmlEngine>
#include <QJSEngine>

class Key: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList keys READ keys)


public:
    Key();

    QStringList keys() const;
    void setKeys(const QStringList &keys);

private:
    QStringList m_keys = QString("1 2 3 4 5 6 7 8 9 0 q w e r t y u i o p a s d f g h j k lz x c v b n m , . /").split(' ');
};


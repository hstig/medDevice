#include "key.h"
#include <QDebug>

Key::Key()
{
}

QStringList Key::keys() const
{
    return m_keys;
}

void Key::setKeys(const QStringList &keys)
{
    m_keys = keys;
}

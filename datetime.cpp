#include "datetime.h"
#include <QDateTime>
#include <QTimer>

DateTime::DateTime(QObject *parent)
    : QObject(parent)
    , m_timer(new QTimer(this))
{
    updateTime();
    m_timer->start(1000);
    connect(m_timer, &QTimer::timeout, this, &DateTime::updateTime);
}

void DateTime::updateTime()
{
    QString currentTime = QDateTime::currentDateTime().toLocalTime().toString(QStringLiteral("hh:mm.ss AP"));
    if(m_currentTime != currentTime) {
        m_currentTime = currentTime;
        Q_EMIT currentTimeChanged();
    }

    QString currentDate = QDateTime::currentDateTime().toLocalTime().toString(QStringLiteral("MMMM d, yyyy"));
    if(m_currentDate != currentDate) {
        m_currentDate = currentDate;
        Q_EMIT currentDateChanged();
    }
}

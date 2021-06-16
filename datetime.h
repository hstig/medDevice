#pragma once
#include <QObject>
#include <QDateTime>
#include <QQmlEngine>
#include <QJSEngine>

class QTimer;
class DateTime : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString currentTime READ currentTime NOTIFY currentTimeChanged)
    Q_PROPERTY(QString currentDate READ currentDate NOTIFY currentDateChanged)
public:
    static DateTime *get() {
        static DateTime m;
        return &m;
    }

    static QObject* qmlInstance(QQmlEngine *qmlEngine, QJSEngine* jsEngine) {
        Q_UNUSED(jsEngine)
        qmlEngine->setObjectOwnership(get(), QQmlEngine::CppOwnership);
        return get();
    }

    QString currentDate() { return m_currentDate; }
    QString currentTime() { return m_currentTime; }

signals:
    void currentTimeChanged();
    void currentDateChanged();

private:
    void updateTime();
    DateTime* operator=(DateTime& other) = delete;
    DateTime(const DateTime& other) = delete;
    DateTime(QObject *parent = nullptr);
    ~DateTime() = default;
    QString m_currentDate;
    QString m_currentTime;
    QTimer *m_timer = nullptr;
};

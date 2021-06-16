#include <QGuiApplication>
#include <QSettings>
#include <QQmlApplicationEngine>

#include "datetime.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QSettings settings(QStringLiteral("myCompany"), QStringLiteral("MedishDemo"), nullptr);

    DateTime::get()->setUtcOffset(settings.value(QStringLiteral("utcOffset"), 0).toInt());
    QObject::connect(DateTime::get(), &DateTime::utcOffsetChanged, [&settings] {
        settings.setValue(QStringLiteral("utcOffset"), DateTime::get()->utcOffset());
    });
    qmlRegisterSingletonType<DateTime>("Helpers", 1, 0, "DateTime", &DateTime::qmlInstance);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

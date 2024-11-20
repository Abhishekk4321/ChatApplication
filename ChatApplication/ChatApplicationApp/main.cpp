#include <QDebug>
#include <QQmlApplicationEngine>
#include <QGuiApplication>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Debugging: Check if the resource is available
    const QUrl url(QStringLiteral("qrc:/main.qml"));


    engine.load(url);

    return app.exec();
}

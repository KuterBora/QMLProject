#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <buttoncontrol.h>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    ButtonControl controller;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    QQmlContext *root_context = engine.rootContext();
    root_context->setContextProperty("controller", &controller);



    return app.exec();
}

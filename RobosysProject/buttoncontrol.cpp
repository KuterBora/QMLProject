#include <QQmlApplicationEngine>
#include "buttoncontrol.h"
#include <QGuiApplication>
#include <QtSql>

ButtonControl::ButtonControl(QObject *parent) : QObject(parent)
{
    db = QSqlDatabase::addDatabase("QODBC");
    db.setDatabaseName("DRIVER={MySQL ODBC 8.0 ANSI Driver}; SERVER=localhost; DATABASE=robosys; UID=root; PASSWORD=Robosys3169!;");
    if (db.open()) {
        qDebug() << "Connected to database.";
    } else {
        qDebug() << "Failed to connect to database.";
    }

}

bool ButtonControl::userExists(QString username, QString password) {
    qDebug() << "checking for account: " + username;
    QSqlQuery query(db);
    query.prepare("SELECT * FROM users");
    query.exec();
    while (query.next()) {
        QString name = query.value(1).toString();
        QString pass = query.value(2).toString();
        if (username == name && encrypt(password) == pass) {
            return true;
        }
    }
    return false;
}

bool ButtonControl::nameTaken(QString username) {
    qDebug() << "checking for account: " + username;
    QSqlQuery query(db);
    query.prepare("SELECT * FROM users");
    query.exec();
    while (query.next()) {
        QString name = query.value(1).toString();
        if (username == name) {
            return true;
        }
    }
    return false;
}

void ButtonControl::addUser(QString username, QString password) {
    QSqlQuery query(db);
    QString insert = "INSERT INTO users (username, password_) values('"
                     + username + "', '" + encrypt(password) + "')";
    query.prepare(insert);
    query.exec();
}

QString ButtonControl::encrypt(QString str) {
    std::string s = str.toStdString();
    int i = 0;
    for (char c : s) {
        s[i] = c + 5;
        i++;
    }
    return QString::fromStdString(s);
}

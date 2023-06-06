#include "buttoncontrol.h"
#include <QtSql>

buttonControl::buttonControl()
{

}

bool userExists(QString username, QString password) {
    QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");
    db.setDatabaseName("DRIVER={MySQL ODBC 8.0 ANSI Driver}; SERVER=localhost;DATABASE=robosys; UID=root; PASSWORD=Robosys3169!;");
    if (db.open()) {
        qDebug() << "checking for account: " + username + " with password: " + password;
        QSqlQuery query(db);
        query.prepare("SELECT * FROM users");
        query.exec();
        while (query.next()) {
            QString name = query.value(1).toString();
            QString pass = query.value(2).toString();
            if (username == name && password == pass) {
                return true;
            }
        }
        return false;
    } else {
        qDebug() << "failed to connect to database.";
        return false;
    }
    return false;
}

void addUser(QString username, QString password) {
    QSqlDatabase db = QSqlDatabase::addDatabase("QODBC");
    db.setDatabaseName("DRIVER={MySQL ODBC 8.0 ANSI Driver}; SERVER=localhost;DATABASE=robosys; UID=root; PASSWORD=Robosys3169!;");
    if (db.open()) {
        QSqlQuery query(db);
        QString insert = "INSERT INTO users (username, password_) values('"
                         + username + "', '" + password + "')";
        query.prepare(insert);
        query.exec();
    } else {
        qDebug() << "failed to connect to database.";
    }
}

#ifndef BUTTONCONTROL_H
#define BUTTONCONTROL_H

#include "qsqldatabase.h"
#include <QObject>
#include <QSql>

class ButtonControl : public QObject
{
    Q_OBJECT
public:
    explicit ButtonControl(QObject *parent = nullptr);
    QSqlDatabase db;
    QString cur_user;
    QString encrypt(QString str);

public slots:
    bool userExists(QString username, QString password);
    bool nameTaken(QString username);
    QString getId(QString username);
    void addUser(QString username, QString password);
    void updateUser(QString username, QString password);
};

#endif // BUTTONCONTROL_H

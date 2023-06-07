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
    QString encrypt(QString str);

public slots:
    bool userExists(QString username, QString password);
    void addUser(QString username, QString password);
    bool nameTaken(QString username);
};

#endif // BUTTONCONTROL_H

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

signals:

public slots:
    bool userExists(QString username, QString password);
    void addUser(QString username, QString password);
};

#endif // BUTTONCONTROL_H

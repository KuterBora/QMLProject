#ifndef BUTTONCONTROL_H
#define BUTTONCONTROL_H

#include <QObject>

class buttonControl
{
public:
    buttonControl();
    bool userExists(QString username, QString password);
    void assUser(QString username, QString password);
};

#endif // BUTTONCONTROL_H

/*
 * Copyright (C) 2013 National University of Defense Technology(NUDT) & Kylin Ltd.
 *
 * Authors:
 *  Kobe Lee    kobe24_lixiang@126.com
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#ifndef SUDODISPATCHER_H
#define SUDODISPATCHER_H

#include <QObject>
#include <QDBusInterface>
#include <QDBusConnection>
#include <QApplication>
#include <QString>
#include <QDeclarativeView>
class SudoDispatcher : public QObject
{
    Q_OBJECT
public:
    explicit SudoDispatcher(QObject *parent = 0);
    Q_INVOKABLE void exit_qt();
    Q_INVOKABLE void show_passwd_dialog();
    Q_INVOKABLE QString get_sudo_daemon_qt();
    QDBusInterface *sudoiface;
signals:

public slots:
private:
    void trans_password(QString flagstr, QString pwd);
};

#endif // SUDODISPATCHER_H
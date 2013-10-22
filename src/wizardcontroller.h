/*
 * Copyright (C) 2013 National University of Defense Technology(NUDT) & Kylin Ltd.
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

#ifndef WIZARDCONTROLLER_H
#define WIZARDCONTROLLER_H

#include <QWizard>
#include <QPoint>

class QSettings;

namespace Ui {
class WizardController;
}

class WizardController : public QWizard
{
    Q_OBJECT
    
public:
    explicit WizardController(QSettings *mSettings = 0, QWidget *parent = 0);
    ~WizardController();

    void loadConf();
    QString get_id_from_cityname(QString cityName);

protected:
    bool eventFilter(QObject *obj, QEvent *event);
    void mouseMoveEvent(QMouseEvent *event);
    void mousePressEvent(QMouseEvent *event);
    void mouseReleaseEvent(QMouseEvent *event);

protected slots:
    void addLocation();
    void delLocation();
    void ChangedBackGround();
    void setSpinValue(int value);
    void writeWeatherConf();
    void setLocation(QString cityName, QString cityId);

signals:
    void transConfValue(QString key, QString value);

private:
    Ui::WizardController *ui;
    QPoint dragPos;
    QAbstractButton *backButton;
    QAbstractButton *nextButton;
    QAbstractButton *finishButton;
    int spinValue;
    QStringList cityList;
    QString newCityName;
    QString newCityId;
    QSettings *pSettings;
//    QString location;
    QStringList newList;
};

#endif // WIZARDCONTROLLER_H

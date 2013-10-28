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
#include "sudodispatcher.h"
#include <QDebug>
#include <QProcessEnvironment>
#include <QtDBus>
#include <QMap>
#include "KThread.h"
#include <QMessageBox>

bool progressFlag;//判断是软件源更新还是软件操作，如果是软件源更新，则为true，qt的进度条隐藏;如果是软件操作，则为默认的false，qt的进度条显示

SudoDispatcher::SudoDispatcher(QObject *parent) :
    QObject(parent)
{
    sudoiface = new QDBusInterface("com.ubuntukylin.Ihu",
                               "/",
                               "com.ubuntukylin.Ihu",
                               QDBusConnection::systemBus());
    progressdialog = new ProgressDialog;
    updatedialog = new UpdateDialog;
    strlist << "Kobe" << "Lee";

    this->mainwindow_width = 850;
    this->mainwindow_height = 600;
    this->alert_width = 292;
    this->alert_width_bg = 329;
    this->alert_height = 54;

    signalFlag = false;

    config = new QSettings(APP_LIST_FILE, QSettings::IniFormat);
    config->setIniCodec("UTF-8");

//    QObject::connect(sudoiface,SIGNAL(clean_complete(QString)),this,SLOT(handlerClearDeb(QString)));
//    QObject::connect(sudoiface,SIGNAL(clean_error(QString)),this,SLOT(handlerClearDebError(QString)));
}

SudoDispatcher::~SudoDispatcher() {
    this->exit_qt();
    if (authdialog) {
        delete authdialog;
    }
    if(progressdialog) {
        delete progressdialog;
    }
    if(updatedialog) {
        delete updatedialog;
    }
}

void SudoDispatcher::exit_qt() {
    sudoiface->call("exit");
}

void SudoDispatcher::bind_signals_after_dbus_start() {
    sudoiface = new QDBusInterface("com.ubuntukylin.Ihu",
                               "/",
                               "com.ubuntukylin.Ihu",
                               QDBusConnection::systemBus());
    QObject::connect(sudoiface,SIGNAL(clean_complete(QString)),this,SLOT(handlerClearDeb(QString)));
    QObject::connect(sudoiface,SIGNAL(clean_error(QString)),this,SLOT(handlerClearDebError(QString)));
    QObject::connect(sudoiface,SIGNAL(software_fetch_signal(QString,QString)),this,SLOT(handlerSoftwareFetch(QString,QString)));
    QObject::connect(sudoiface,SIGNAL(software_apt_signal(QString,QString)),this,SLOT(handlerSoftwareApt(QString,QString)));
    QObject::connect(sudoiface,SIGNAL(software_check_status_signal(QStringList)),this,SLOT(handlerGetSoftwareListStatus(QStringList)));
    QObject::connect(this,SIGNAL(sendDynamicSoftwareProgress(QString,QString)),progressdialog, SLOT(setDynamicSoftwareProgress(QString,QString)));
    QObject::connect(updatedialog,SIGNAL(call_update()),this, SLOT(startUpdateSoftwareSource()));
    QObject::connect(progressdialog,SIGNAL(softwareSourceUpdateProgressToSudoDispather(QString)),this, SLOT(getSoftwareSourceUpdateProgress(QString)));
}

QString SudoDispatcher::get_sudo_daemon_qt() {
    QDBusReply<QString> reply = sudoiface->call("get_sudo_daemon");
    return reply.value();
}

//void SudoDispatcher::reGetStatusList() {
//    emit reGetList();
//}

bool SudoDispatcher::getUKSignalFlag() {
    return signalFlag;
}

void SudoDispatcher::setUKSignalFlag(bool flag) {
    signalFlag = flag;
}

void SudoDispatcher::getSoftwareSourceUpdateProgress(QString cur_status) {
    emit notifySourceStatusToQML(cur_status);
}

void SudoDispatcher::handlerClearDeb(QString msg) {
     emit finishCleanDeb(msg);
}

void SudoDispatcher::handlerClearDebError(QString msg) {
     emit finishCleanDebError(msg);
}


//下载
void SudoDispatcher::handlerSoftwareFetch(QString type, QString msg) {
    if(!type.isEmpty()) {
        //下载过程中把数据给进度条
        emit sendDynamicSoftwareProgress(type, msg);
        //下载完成
        if(type == "down_stop") {
            emit finishSoftwareFetch(type, msg);
        }
    }
}

//apt操作
void SudoDispatcher::handlerSoftwareApt(QString type, QString msg) {
    if(!type.isEmpty()) {
        //操作过程中把数据给进度条
        emit sendDynamicSoftwareProgress(type, msg);
        //操作完成
        if (type == "apt_stop") {
            emit finishSoftwareApt(type);
        }
    } 
}

//得到所有软件的状态
void SudoDispatcher::handlerGetSoftwareListStatus(QStringList statusDict) {
    status_dict.clear();
    for(int i=0; i< statusDict.size(); i++) {
        QStringList value = statusDict[i].split(":");
        status_dict.insert(value[0], value[1]);
    }
//    qDebug() << status_dict;
}

void SudoDispatcher::showPasswdDialog(int window_x, int window_y) {
    authdialog = new AuthDialog("提示：请输入当前用户登录密码启动服务，保证优客助手的正常使用。");
    this->alert_x = window_x + (mainwindow_width / 2) - (alert_width_bg  / 2);
    this->alert_y = window_y + mainwindow_height - 400;
    authdialog->move(this->alert_x, this->alert_y);
    authdialog->exec();
}

void SudoDispatcher::showUpdateSourceDialog(int window_x, int window_y) {
    progressFlag = true;//此时让qt的进度条隐藏
    this->alert_x = window_x + (mainwindow_width / 2) - (alert_width  / 2);
    this->alert_y = window_y + mainwindow_height - 400;
    updatedialog->move(this->alert_x, this->alert_y);
    updatedialog->show();
}

void SudoDispatcher::showProgressDialog(int window_x, int window_y) {
    progressFlag = false;//此时让qt的进度条显示
    this->alert_x = window_x + (mainwindow_width / 2) - (alert_width  / 2);
    this->alert_y = window_y + mainwindow_height - 400;
    progressdialog->move(this->alert_x, this->alert_y);
    progressdialog->show();
}

void SudoDispatcher::clean_package_cruft_qt(QStringList strlist) {
    KThread *thread = new KThread(strlist, sudoiface, "clean_package_cruft");
    thread->start();
}

//从状态列表中得到指定的某个软件的状态
QString SudoDispatcher::getSoftwareStatus(QString key) {
    QVariant tt = status_dict.value(key);
    return tt.toString();
}

//QStringList SudoDispatcher::getUKSoftwareList() {
//    QStringList softwareList;
//    softwareList << "wps-office" << "lotus" << "kuaipan4uk" << "kugou" << "ppstream";
//    return softwareList;
//}

// -------------------------software-center-------------------------
void SudoDispatcher::install_pkg_qt(QString pkgName) {
    KThread *thread = new KThread(strlist, sudoiface, "install_pkg", pkgName);
    thread->start();
}

void SudoDispatcher::uninstall_pkg_qt(QString pkgName) {
    KThread *thread = new KThread(strlist, sudoiface, "uninstall_pkg", pkgName);
    thread->start();
}

void SudoDispatcher::update_pkg_qt(QString pkgName) {
    KThread *thread = new KThread(strlist, sudoiface, "update_pkg", pkgName);
    thread->start();
}

void SudoDispatcher::check_pkgs_status_qt(QStringList pkgNameList) {
    KThread *thread = new KThread(pkgNameList, sudoiface, "check_pkgs_status");
    thread->start();
}

QString SudoDispatcher::check_pkg_status_qt(QString pkgName) {
    QDBusReply<QString> reply = sudoiface->call("check_pkg_status", pkgName);
    return reply.value();
}

//void SudoDispatcher::notifySoftwareCurrentStatus(QString current_status) {
//    emit sendSoftwareStatus(current_status);
//}

void SudoDispatcher::apt_get_update_qt() {
    QStringList tmplist;
    tmplist << "Kobe" << "Lee";
    KThread *thread = new KThread(tmplist, sudoiface, "apt_get_update");
    thread->start();
}

//void SudoDispatcher::add_source_ubuntukylin_qt() {
//    sudoiface->call("add_source_ubuntukylin");
//}

//void SudoDispatcher::remove_source_ubuntukylin_qt() {
//    sudoiface->call("remove_source_ubuntukylin");
//}

void SudoDispatcher::ready_show_app_page(QString flag) {
    emit sendAppInfo(flag);
}

QString SudoDispatcher::getSingleInfo(QString key) {
    QString info = appInfo.value(key);
    return info;
}

//获取所有软件的的可执行程序的名字列表，此名字对应着源里面的安装程序的名字，用该名字可以获取软件状态
QStringList SudoDispatcher::getAllSoftwareExecNameList() {
//    QStringList pkgNameList;
//    pkgNameList << "eclipse" << "qtcreator"<< "wps-office" << "wine-qq2012-longeneteam" << \
//                   "flashplugin-installer" <<  "lotus" << "kuaipan4uk" <<"vlc" << \
//                   "chromium-bsu" << "kugou" << "ppstream" << "qbittorrent" << \
//                   "virtualbox" << "stardict" << "xchat" << "wine-thunder" << "openfetion";
//    return pkgNameList;

    QStringList execNameList = config->value(QString("app-list/AllExecList")).toStringList();
    config->sync();
    return execNameList;

}

//得到所有app的列表，根据列表的名字可以显示所有软件机器logo到推荐界面上
void SudoDispatcher::getAppListForDisPlay() {
    QFile appFile(APP_LIST_FILE);
    if(appFile.exists()) {
        appList = config->value(QString("app-list/AppList")).toStringList();
        config->sync();
        emit sendAppListToQML(appList);
    }
    else {
        QMessageBox::warning(NULL,
                             tr("警告"),
                             tr("没有找到软件列表文件！"),
                             QMessageBox::Ok);
    }
}

void SudoDispatcher::getAppInfo(QString flag) {
    QFile appFile(APP_LIST_FILE);
    if(appFile.exists()) {
        appInfo["name"] = config->value(flag + QString("/name")).toString();
        appInfo["title"] = config->value(flag + QString("/title")).toString();
        appInfo["logo"] = config->value(flag + QString("/logo")).toString();
        appInfo["description"] = config->value(flag + QString("/description")).toString();
        appInfo["image1"] = config->value(flag + QString("/image1")).toString();
        appInfo["image2"] = config->value(flag + QString("/image2")).toString();
        config->sync();
    }
    else {
        QMessageBox::warning(NULL,
                             tr("警告"),
                             tr("没有找到软件列表文件！"),
                             QMessageBox::Ok);
    }
}

void SudoDispatcher::startUpdateSoftwareSource() {
    progressdialog->hide();
    emit callMasklayer();
    apt_get_update_qt();
}

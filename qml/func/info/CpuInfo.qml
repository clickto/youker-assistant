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

import QtQuick 1.1
import SystemType 0.1
import "../common" as Common
import "../bars" as Bars

Rectangle {
    id: home
    width: parent.width; height: 475
    color: "transparent"

    Component.onCompleted: {
        systemdispatcher.get_cpu_info_qt();//获取详细信息
        var msg = systemdispatcher.getSingleInfo("CpuVendor", "cpu");
        var pat1 = new RegExp('Intel');
        var pat2 = new RegExp('AMD');
        var pat3 = new RegExp('Vimicro');
        if(pat1.test(msg)) {
            logo.source =  "../../img/logo/Manufacturer/INTEL.jpg";
        }
        else if(pat2.test(msg)) {
            logo.source =  "../../img/logo/Manufacturer/AMD.jpg";
        }
        else if(pat3.test(msg)) {
            logo.source =  "../../img/logo/Manufacturer/VIMICRO.jpg";
        }
//        if(msg.indexOf("Intel") > 0) {
//            logo.source =  "../../img/logo/Manufacturer/INTEL.jpg";
//        }
//        else if(msg.indexOf("AMD") > 0 || msg.indexOf("Amd") > 0) {
//            logo.source =  "../../img/logo/Manufacturer/AMD.jpg";
//        }
//        else if(msg.indexOf("VIMICRO") > 0 || msg.indexOf("Vimicro") > 0) {
//            logo.source =  "../../img/logo/Manufacturer/VIMICRO.jpg";
//        }

        cpuversionText.text = systemdispatcher.getSingleInfo("CpuVersion", "cpu");
        cpuverdorText.text = systemdispatcher.getSingleInfo("CpuVendor", "cpu");
        cpuserialText.text = systemdispatcher.getSingleInfo("CpuSerial", "cpu");
        slotText.text = systemdispatcher.getSingleInfo("CpuSlot", "cpu");
        maxText.text = systemdispatcher.getSingleInfo("CpuCapacity", "cpu") + "MHz";
        curText.text = systemdispatcher.getSingleInfo("CpuSize", "cpu") + "MHz";
        frontText.text = systemdispatcher.getSingleInfo("CpuClock", "cpu") + "MHz";
        coresText.text = systemdispatcher.getSingleInfo("cpu_cores", "cpu") + qsTr("cores") + "/" + systemdispatcher.getSingleInfo("cpu_siblings", "cpu") + qsTr("thread");
        cache1.text = systemdispatcher.getSingleInfo("clflush_size", "cpu") + "KB";
        cache2.text = systemdispatcher.getSingleInfo("cache_size", "cpu") + "KB";
    }
    Column {
        anchors {
            top: parent.top
            topMargin: 40
            left: parent.left
            leftMargin: 30
        }
        spacing: 20

        Row {
            Text {
                id: bartitle
                text: qsTr("CPU information")//处理器信息
                font.bold: true
                font.pixelSize: 14
                color: "#383838"
            }
            Rectangle {width: home.width - bartitle.width - 30 * 2
                anchors.verticalCenter: parent.verticalCenter
                height: 1; color: "#ccdadd"
            }
        }
        Column {
            anchors.left: parent.left
            anchors.leftMargin: 20
            spacing: 10
            Row {
                spacing: 10
                Text {
                    text: qsTr("CPU:")//处理器：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: cpuversionText
                    text: ""//systemdispatcher.getSingleInfo("CpuVersion")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Vendor:")//制造商：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: cpuverdorText
                    text: ""//systemdispatcher.getSingleInfo("CpuVendor")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Serial:")//序列号：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: cpuserialText
                    text: ""//systemdispatcher.getSingleInfo("CpuSerial")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Socket/Slot:")//插座/插槽：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: slotText
                    text: ""//systemdispatcher.getSingleInfo("CpuSlot")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Maximum Frequency:")//最大主频：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: maxText
                    text: ""//systemdispatcher.getSingleInfo("CpuCapacity") + "MHz"
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Current Frequency:")//当前主频：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: curText
                    text: ""//systemdispatcher.getSingleInfo("CpuSize") + "MHz"
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Front-side Bus:")//前端总线：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: frontText
                    text: ""//systemdispatcher.getSingleInfo("CpuClock") + "MHz"
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Cores Number:")//核心数目：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: coresText
                    text: ""//systemdispatcher.getSingleInfo("cpu_cores") + qsTr("cores") + "/" + systemdispatcher.getSingleInfo("cpu_siblings") + qsTr("thread")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("First-level caching:")//一级缓存：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: cache1
                    text: ""//systemdispatcher.getSingleInfo("clflush_size") + "KB"
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Second-level caching:")//二级缓存：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: cache2
                    text: ""//systemdispatcher.getSingleInfo("cache_size") + "KB"
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
        }
    }
    //logo
    Image {
        id: logo
        source: ""
        anchors {
            top: parent.top
            topMargin: 50
            right: parent.right
            rightMargin: 30
        }
    }
}
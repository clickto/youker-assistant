/*
 * Copyright (C) 2013 ~ 2014 National University of Defense Technology(NUDT) & Kylin Ltd.
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
import "../common" as Common
import "../bars" as Bars

Rectangle {
    id: touchpadsetpage
    property bool on: true
    width: parent.width
    height: 475
    property string fontName: "Helvetica"
    property int fontSize: 12
    property color fontColor: "black"
    property string scrollbars_mode: ""
    property string touchscrolling_mode: ""
    property string actiontitle: qsTr("Touchpad settings")//触摸板设置
    property string actiontext: qsTr("By setting the relevant properties of your touchpad, make the operation more convenient.")//通过调整您触摸板的相关设置，使操作更加便捷。
    //背景
    Image {
        source: "../../img/skin/bg-middle.png"
        anchors.fill: parent
    }

    Component.onCompleted: {
        touchpadsetpage.scrollbars_mode = sessiondispatcher.get_scrollbars_mode_qt();
//        sessiondispatcher.write_default_configure_to_qsetting_file("touchpad", "scrolltype", touchpadsetpage.scrollbars_mode);
        touchpadsetpage.touchscrolling_mode = sessiondispatcher.get_touchscrolling_mode_qt();//edge-scrolling
//        sessiondispatcher.write_default_configure_to_qsetting_file("touchpad", "scrollmode", touchpadsetpage.touchscrolling_mode);
        if (sessiondispatcher.get_touchpad_enable_qt()) {
            touchpadswitcher.switchedOn = true;
//            sessiondispatcher.write_default_configure_to_qsetting_file("touchpad", "enable", "true");
        }
        else {
            touchpadswitcher.switchedOn = false;
//            sessiondispatcher.write_default_configure_to_qsetting_file("touchpad", "enable", "false");
        }

        if (sessiondispatcher.get_touchscrolling_use_horizontal_qt()) {
            horizontalswitcher.switchedOn = true;
//            sessiondispatcher.write_default_configure_to_qsetting_file("touchpad", "horizontal", "true");
        }
        else {
            horizontalswitcher.switchedOn = false;
//            sessiondispatcher.write_default_configure_to_qsetting_file("touchpad", "horizontal", "false");
        }
    }

    Column {
        spacing: 10
        anchors.top: parent.top
        anchors.topMargin: 44
        anchors.left: parent.left
        anchors.leftMargin: 80
        Row {
            spacing: 50
            Text {
                 text: touchpadsetpage.actiontitle
                 font.bold: true
                 font.pixelSize: 14
                 color: "#383838"
             }
            //status picture
            Common.StatusImage {
                id: statusImage
                visible: false
                iconName: "green.png"
                text: qsTr("Completed")//已完成
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Text {
            width: touchpadsetpage.width - 80 - 20
            text: touchpadsetpage.actiontext
            wrapMode: Text.WordWrap
            font.pixelSize: 12
            color: "#7a7a7a"
        }
    }

    Row {
        id: settitle
        anchors{
            left: parent.left
            leftMargin: 40
            top: parent.top
            topMargin: 120

        }
        spacing: 5
        Text{
            id: switchtitle
            text: qsTr("Switch settings")//开关设置
            font.bold: true
            font.pixelSize: 12
            color: "#383838"
        }
        //横线
        Common.Separator {
            anchors.verticalCenter: parent.verticalCenter
            width: touchpadsetpage.width - switchtitle.width - 40 * 2
        }
    }
    Row {
        id: setcontext
        spacing: 200
        anchors{
            left: parent.left
            leftMargin: 60
            top: settitle.bottom
            topMargin: 20
        }
        Row {
            spacing: 40
            Common.Label {
                width: 130
                text: qsTr("Enable/Disable touchpad: ")//启用/禁用触摸板：
                font.pixelSize: 12
                color: "#7a7a7a"
    //                anchors.verticalCenter: parent.verticalCenter
            }
            Common.Switch {
                id: touchpadswitcher
                width: 125
                onSwitched: {
                    if (touchpadswitcher.switchedOn) {
                        sessiondispatcher.set_touchpad_enable_qt(true);
                    }
                    else if(!touchpadswitcher.switchedOn) {
                        sessiondispatcher.set_touchpad_enable_qt(false);
                    }
                }
            }
        }
        Common.Button {
            hoverimage: "blue.png"
            text: qsTr("Restore")//恢复默认
            width: 94
            height: 29
            fontsize: 13
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                sessiondispatcher.set_default_system_qt("touchpad-enabled");//启用禁用触摸板
                if (sessiondispatcher.get_touchpad_enable_qt()) {
                    touchpadswitcher.switchedOn = true;
                }
                else {
                    touchpadswitcher.switchedOn = false;
                }
            }
        }
    }

    Row {
        id: scrollrow
        anchors{
            left: parent.left
            leftMargin: 40
            top: setcontext.bottom
            topMargin: 30

        }
        spacing: 5
        Text{
            id: scrolltitle
            text: qsTr("Property settings")//属性设置
            font.bold: true
            font.pixelSize: 12
            color: "#383838"
        }
        //横线
        Rectangle{
            width: touchpadsetpage.width - scrolltitle.width - 40 * 2
            height:1
            color:"#b9c5cc"
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Column {
        spacing: 30
        anchors{
            left: parent.left
            leftMargin: 60
            top: scrollrow.bottom
            topMargin: 30
        }

        Row {
            spacing: 200
            Row {
                id: workmode
                spacing: 40
                Common.Label {
                    width: 130
                    text: qsTr("Scrollbar type: ")//滚动条类型：
                    font.pixelSize: 12
                    color: "#7a7a7a"
                    anchors.verticalCenter: parent.verticalCenter
                }
        //        GroupBox {
        //            anchors.verticalCenter: parent.verticalCenter
        //                title: qsTr("触摸板滚动条触发方式:")
        //            adjustToContentSize: true
                    Common.ButtonRow {
                        exclusive: true//控制是否联动
                        spacing: 100
                        Common.CheckBox {
                            id:overlay
                            titleName: qsTr("Features Type") //特色类型
                            checked: (touchpadsetpage.scrollbars_mode == "overlay-auto") ? true : false
                            flag: "radio"
                            onClicked: {
                                if (overlay.checked == true) {
                                    if(touchpadsetpage.scrollbars_mode != "overlay-auto") {
                                        sessiondispatcher.set_scrollbars_mode_overlay_qt();
                                        touchpadsetpage.scrollbars_mode = "overlay-auto";
                                        statusImage.visible = true;
                                    }
                                }
                            }
                        }
                        Common.CheckBox {
                            id: legacy
                            titleName: qsTr("Standard Type")  //标准类型
                            checked: (touchpadsetpage.scrollbars_mode == "normal") ? true : false
                            flag: "radio"
                            onClicked: {
                                if (legacy.checked == true) {
                                    if(touchpadsetpage.scrollbars_mode != "normal") {
                                        sessiondispatcher.set_scrollbars_mode_legacy_qt();
                                        touchpadsetpage.scrollbars_mode = "normal";
                                        statusImage.visible = true;
                                    }
                                }
                            }
                        }
        //            }
                }
            }
            Common.Button {
                hoverimage: "blue.png"
                text: qsTr("Restore")//恢复默认
                width: 94
                height: 29
                fontsize: 13
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    sessiondispatcher.set_default_system_qt("scrollbar-mode");//滚动条类型
                    var default_type = sessiondispatcher.get_scrollbars_mode_qt();
                    if(default_type == "overlay-auto") {
                        overlay.checked = true;
                    }
                    else if(default_type == "normal") {
                        legacy.checked = true;
                    }
                }
            }
        }



        Row {
            spacing: 200
            Row {
                id: scrollstyle
                spacing: 40
                Common.Label {
                    width: 130
                    text: qsTr("Touchpad scroll trigger mode: ")//触摸板滚动触发方式：
                    font.pixelSize: 12
                    color: "#7a7a7a"
                    anchors.verticalCenter: parent.verticalCenter
                }
        //        GroupBox {
        //            anchors.verticalCenter: parent.verticalCenter
        //                title: qsTr("触摸板滚动模式:")
        //            adjustToContentSize: true
                    Common.ButtonRow {
                        exclusive: true//控制是否联动
                        spacing: 100
                        Common.CheckBox {
                            id:edge
                            titleName: qsTr("Edgemotion")//边缘触发
                            checked: (touchpadsetpage.touchscrolling_mode == "edge-scrolling") ? true : false
                            flag: "radio"
                            onClicked: {
                                if (edge.checked == true) {
                                    if(touchpadsetpage.touchscrolling_mode != "edge-scrolling") {
                                        sessiondispatcher.set_touchscrolling_mode_edge_qt();
                                        touchpadsetpage.touchscrolling_mode = "edge-scrolling";
                                        statusImage.visible = true;
                                    }
                                }
                            }
                        }
                        Common.CheckBox {
                            id: twofinger
                            titleName: qsTr("Twofinger Scroll")//双指触发
                            checked: (touchpadsetpage.touchscrolling_mode == "two-finger-scrolling") ? true : false
                            flag: "radio"
                            onClicked: {
                                if (twofinger.checked == true) {
                                    if(touchpadsetpage.touchscrolling_mode != "two-finger-scrolling") {
                                        sessiondispatcher.set_touchscrolling_mode_twofinger_qt();
                                        touchpadsetpage.touchscrolling_mode = "two-finger-scrolling";
                                        statusImage.visible = true;
                                    }
                                }
                            }
                        }
        //            }
                }
            }
            Common.Button {
                hoverimage: "blue.png"
                text: qsTr("Restore")//恢复默认
                width: 94
                height: 29
                fontsize: 13
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    sessiondispatcher.set_default_system_qt("scroll-method");//触摸板滚动条触发方式
                    var default_mode = sessiondispatcher.get_touchscrolling_mode_qt();
                    if(default_mode == "edge-scrolling") {
                        edge.checked = true;
                    }
                    else if(default_mode == "two-finger-scrolling") {
                        twofinger.checked = true;
                    }
                }
            }
        }


        Row {
            spacing: 200
            Row {
                id: horizontalscroll
                spacing: 40
                Common.Label {
                    width: 130
                    text: qsTr("Touchpad horizontal scroll: ")//触摸板横向滚动：
                    font.pixelSize: 12
                    color: "#7a7a7a"
                    anchors.verticalCenter: parent.verticalCenter
                }
                Common.Switch {
                    id: horizontalswitcher
                    width: 125
                    onSwitched: {
                        if (horizontalswitcher.switchedOn) {
                            sessiondispatcher.set_touchscrolling_use_horizontal_qt(true);
                        }
                        else if(!horizontalswitcher.switchedOn) {
                            sessiondispatcher.set_touchscrolling_use_horizontal_qt(false);
                        }
                    }
                }
            }
            Common.Button {
                hoverimage: "blue.png"
                text: qsTr("Restore")//恢复默认
                width: 94
                height: 29
                fontsize: 13
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    sessiondispatcher.set_default_system_qt("horiz-scroll-enabled");//触摸板横向滚动
                    if (sessiondispatcher.get_touchscrolling_use_horizontal_qt()) {
                        horizontalswitcher.switchedOn = true;
                    }
                    else {
                        horizontalswitcher.switchedOn = false;
                    }
                }
            }
        }
    }



    //顶层工具栏
    Bars.TopBar {
        id: topBar
        width: 28
        height: 26
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.left: parent.left
        anchors.leftMargin: 40
        opacity: 0.9
        onButtonClicked: {
            var num = sessiondispatcher.get_page_num();
            if (num == 0) {
                pageStack.push(homepage);
            }
            else if (num == 3) {
                pageStack.push(systemset);
            }
            else if (num == 4) {
                pageStack.push(functioncollection);
            }
        }
    }
    //底层工具栏
    Bars.ToolBar {
        id: toolBar
        showok: false
        height: 50; anchors.bottom: parent.bottom; width: parent.width; opacity: 0.9
        onQuitBtnClicked: {
            var num = sessiondispatcher.get_page_num();
            if (num == 0) {
                pageStack.push(homepage);
            }
            else if (num == 3) {
                pageStack.push(systemset);
            }
            else if (num == 4) {
                pageStack.push(functioncollection);
            }
        }
    }
    Timer {
         interval: 5000; running: true; repeat: true
         onTriggered: statusImage.visible = false
    }
}

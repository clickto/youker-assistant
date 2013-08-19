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


import QtQuick 1.1
import SessionType 0.1
import SystemType 0.1
import "common" as Common

Item {
    id:root
    width: parent.width
    height: 435//475
    property string btn_text: "开始扫描"
    property string title: "快速找出最占用磁盘空间的大文件"
    property string description: "删除占用磁盘空间的无用大文件，释放更多磁盘空间。"
    property string btn_flag: "largestfile_work"
    property SystemDispatcher dis: systemdispatcher
    property ListModel listmodel: mainModel
    property ListModel submodel: subModel
    property int sub_num: 0
    property string work_result: ""
    //箭头图标
    property string arrow: '../img/icons/arrow.png'
    //母项字体
    property string headerItemFontName: "Helvetica"
    property int headerItemFontSize: 12
    property color headerItemFontColor: "black"
    //子项字体
    property string subItemFontName: "Helvetica"
    property int subItemFontSize: headerItemFontSize-2
    property color subItemFontColor: "black"
    property bool check_flag: true
    property int itemHeight: 40
//    property alias expandedItemCount: subItemRepeater.count
    property bool expanded: true //kobe:子项扩展默认打开
    property bool null_flag: false

    property string directory: ""


    function refresh_page() {
//        var largestfile_data = systemdispatcher.scan_of_large_qt(root.directory);
        var largestfile_data = sessiondispatcher.scan_of_large_qt(root.directory);
        if (largestfile_data == "")
            root.null_flag = true;
        else
            root.null_flag = false;
        root.sub_num = largestfile_data.length;
        systemdispatcher.clear_largestfile_args();
        subModel.clear();
        var num = 0;
        for (var i=0; i< largestfile_data.length; i++) {
//                console.log(unneed_data[i]);//linux-headers-3.8.0-19<2_2>Header files related to Linux kernel version 3.8.0<2_2>60094464
            var splitlist = largestfile_data[i].split("<2_2>");
            if (splitlist[0] == "") {
                num++;
            }
            else {
                subModel.append({"itemTitle": splitlist[0] + "字节", "desc": splitlist[1]});
                systemdispatcher.set_largestfile_args(splitlist[1]);
            }
        }
        root.sub_num -= num;
        mainModel.clear();
        console.log(systemdispatcher.get_largestfile_args());
        mainModel.append({"itemTitle": "清理最大文件",
                         "picture": "../img/toolWidget/deb-min.png",
                         "detailstr": "清理用户指定目录下的最大文件，节省磁盘空间",
                         "flags": "clear_largestfile",
                        "attributes":
                             [{"subItemTitle": "Cookies1"},
                             {"subItemTitle": "Cookies2"},
                             {"subItemTitle": "Cookies3"},
                             {"subItemTitle": "Cookies4"}]
                         })
    }


    ListModel {
        id: mainModel
        ListElement {
            itemTitle: "清理最大文件"
            picture: "../img/toolWidget/deb-min.png"
            detailstr: "清理用户指定目录下的最大文件，节省磁盘空间"
            flags: "clear_largestfile"
            attributes: [
                ListElement { subItemTitle: "" }
            ]
        }

    }

    ListModel {
        id: subModel
        ListElement {itemTitle: ""; desc: ""}
    }



    //信号绑定，绑定qt的信号finishCleanWork，该信号emit时触发onFinishCleanWork
    Connections
    {
        target: systemdispatcher
//         onFinishScanWork: {
        //             if (btn_flag == "package_scan") {
        //                 console.log("******package_scan Signal handler received  Start******");
        ////                 console.log("33333333333333");
        ////                 console.log(msg);
        //                 titleBar.work_result = msg;
        //                 titleBar.state = "UnneedWork";
        //             }

//         }
        onFinishCleanWork: {
//            console.log(msg);//apt software   package   history   cookies
            if (btn_flag == "largestfile_work") {
                if (msg == "largestfile") {
                    root.work_result = msg;
                    root.state = "LargestFileWorkFinish";
                }
            }
        }
    }

//    //背景
    Image {
        source: "../img/skin/bg-bottom-tab.png"
        anchors.fill: parent
    }


    //titlebar
    Row {
        id: titlebar
        spacing: 20
        width: parent.width
//        height: 50
        anchors { top: parent.top; topMargin: 20; left: parent.left; leftMargin: 20 }
//        Image {
//            id: refreshArrow
//            source: "../img/toolWidget/find.gif"
////            width: 50; height: 50
//            Behavior on rotation { NumberAnimation { duration: 200 } }
//        }
        AnimatedImage {
            id: refreshArrow
            source: "../img/toolWidget/find.gif"
        }
        Column {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 10
            Text {
                text: root.title
                font.bold: true
                font.pixelSize: 14
                color: "#383838"
            }
            Text {
                text: root.description
                font.pixelSize: 12
                color: "#7a7a7a"
            }
        }

        //status picture
        Image {
            id: statusImage
            source: "../img/toolWidget/unfinish.png"
            fillMode: "PreserveAspectFit"
            smooth: true
            anchors {
                right: label.left
                rightMargin: 20
                verticalCenter: parent.verticalCenter
            }
        }

        Common.Label {
            id: label
            visible: false
            text: ""
            anchors.right: bitButton.left
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
        }
        Common.Button {
            id: bitButton
            width: 120
            height: 39
            hoverimage: "clear-start.png"
            anchors.right: parent.right
            anchors.rightMargin: 50
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                if (root.directory == "")
                    sessiondispatcher.send_warningdialog_msg("友情提示：","对不起，您没有选择扫描路径，请点击“浏览”按钮选择！");
                else {
                    if(root.null_flag == true) {
                       root.state = "LargestFileWorkEmpty";
                        sessiondispatcher.send_warningdialog_msg("友情提示：","扫描内容为空，不再执行清理！");
                    }
                    else if(root.null_flag == false) {
                        console.log(systemdispatcher.get_largestfile_args());
                        systemdispatcher.clean_file_cruft_qt(systemdispatcher.get_largestfile_args(), "largestfile");
//                        sessiondispatcher.clean_file_cruft_qt(systemdispatcher.get_largestfile_args(), "largestfile");
                        root.state = "LargestFileWorkFinish";
                    }
                }
            }
        }
    }
    //分割条
    Rectangle {
        id: splitbar
        anchors {
            top: titlebar.bottom
            topMargin: 18
            left: parent.left
            leftMargin: 2
        }
        width: parent.width - 4
        height: 1
        color: "#b9c5cc"
    }

    Component {
        id: listViewDelegate
        Item {
            id: delegate
            property alias expandedItemCount: subItemRepeater.count
            x: 5; y: 2
            width: root.width
            height: headerItemRect.height + subItemsRect.height

            //母项
            //checkbox, picture and words
            Row {
                id: headerItemRect
                x: 5; y: 2
                width: root.width
                height: root.itemHeight
                spacing: 10
                Image {
                    id: clearImage
                    fillMode: "PreserveAspectFit"
                    height: parent.height*0.9
                    source: picture
                    smooth: true
                }

                Column {
                    id: status_update_content
                    spacing: 5
                    anchors {
                        left: clearImage.right; leftMargin: 15
                        verticalCenter: parent.verticalCenter
                    }
                    Text {
                        text: itemTitle
                        font.pointSize: 11
                        color: "black"
                    }
                    Text {
                        text: detailstr
                        font.pointSize: 9
                        color: "gray"
                    }
                }
                Common.Button {
                    id: selectBtn
                    anchors {
                        left: clearImage.right
                        verticalCenter: parent.verticalCenter
                        leftMargin: 600
                    }
                    hoverimage: "browser-green.png"
                    width: 95
                    height: 30
                    onClicked: {
                        root.directory = sessiondispatcher.show_folder_dialog();
                        if (root.directory != "") {
                            refresh_page();
                            root.state = "LargestFileWorkAgain";
                        }
                    }
                }

                Image {
                    id: arrow
                    fillMode: "PreserveAspectFit"
//                    height: parent.height*0.3
                    height: 28
                    width: 26
                    source: root.arrow
                    //当鼠标点击后,箭头图片旋转90度
//                    rotation: expanded ? 90 : 0
                    rotation: expanded ? 0 : -180
                    smooth: true
                    anchors {
                        left: clearImage.right
                        verticalCenter: parent.verticalCenter
                        leftMargin: 750
                    }
                }

                MouseArea {
                    id: mouseRegion
                    anchors.fill: status_update_content
                    onPressed: {
                        expanded = !expanded
                    }
                }
            }//母项Row

            //子项
            Item {
                id: subItemsRect
                property int itemHeight: root.itemHeight
                y: headerItemRect.height
                width: root.width
                //当高度需要扩展时,根据expandedItemCount数目和itemHeight高度去扩展
                height: expanded ? delegate.expandedItemCount * itemHeight : 0
                clip: true
                opacity: 1
                Behavior on height {
                    SequentialAnimation {
                        NumberAnimation { duration: 100; easing.type: Easing.InOutQuad }
                    }
                }

                Column {
                    width: root.width
                    Repeater {
                        id: subItemRepeater
//                        model: attributes
                        model: subModel
//                        model: mysubmodel
                        width: subItemsRect.width
                        ListItem {
                            id: subListItem
                            width: root.width
                            height: subItemsRect.itemHeight
//                            text: subItemTitle
                            text: itemTitle
                            descript: desc
//                            size_num: number
                            checkbox_status: root.check_flag
//                            bgImage: "../../img/icons/list_subitem.png"
                            bgImage: ""
                            fontName: root.subItemFontName
                            fontSize: root.subItemFontSize
                            fontColor: root.subItemFontColor
                            textIndent: 20

                            btn_flag: root.btn_flag

                            onClicked: {/*console.log(number)*/}
                        }

                    }//Repeater
                }//Column
            }//子项Item
        }
    }//Component


    Common.ScrollArea {
        frame:false
        anchors.top: titlebar.bottom
        anchors.topMargin: 30
        height: root.height -titlebar.height - 50
        width: parent.width
        Item {
            width: parent.width
            height: (root.sub_num + 1) * 40 //450 + //this height must be higher than root.height, then the slidebar can display
            //垃圾清理显示内容
            ListView {
                id: listView
                height: parent.height
                model: mainModel
                delegate: listViewDelegate
                cacheBuffer: 1000
                opacity: 1
                spacing: 10
                snapMode: ListView.NoSnap
                boundsBehavior: Flickable.DragOverBounds
                currentIndex: 0
                preferredHighlightBegin: 0
                preferredHighlightEnd: preferredHighlightBegin
                highlightRangeMode: ListView.StrictlyEnforceRange
            }
        }//Item
    }//ScrollArea


    states: [
        State {
            name: "LargestFileWorkAgain"
            PropertyChanges { target: statusImage; source: "../img/toolWidget/unfinish.png"}
        },
        State {
            name: "LargestFileWorkFinish"
            PropertyChanges { target: statusImage; source: "../img/toolWidget/finish.png"}
        },
        State {
            name: "LargestFileWorkEmpty"
            PropertyChanges { target: statusImage; source: "../img/toolWidget/finish.png"}
        }
    ]
}
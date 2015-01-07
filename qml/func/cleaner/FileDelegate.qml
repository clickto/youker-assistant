import QtQuick 1.1
import "../common" as Common

Item {
    id: listViewDelegate
    property int itemHeight: 30
    property string arrow: '../../img/icons/arrow.png'
    property bool expanded: true
    property int heightMark:sub_num
    //需要传值:
    property string btn_flag
    property ListModel sub_model
    property int sub_num    //接收清理界面扫描出子项的个数
    property int arrow_display: 0   //控制清理界面下拉图标显示还是透明的变量

    property bool delegate_flag: false
    //子项字体
    property string subItemFontName: "Helvetica"
    property int subItemFontSize: 10
    property color subItemFontColor: "black"

    //总控开关的初始值
    property string main_check_value: "false"

    //传出的值,控制子列表的伸缩
    signal subpressed(int hMark);
    signal checkchanged(bool checkchange);

    signal transmitFileItemCheckBoxStatus(bool status, int index); //test
    signal transmitFileItemMainCheckBoxStatus(bool status); //test


    property int check_num:sub_num   //记录子项个数，在确定总checkbox状态时需要的变量
    property bool maincheck: false
    property int arrow_num: 0
    width: parent.width

    Item {
        id: delegate
        property alias expandedItemCount: subItemRepeater.count
        x: 2; y: 2
        width: parent.width
        height: headerItemRect.height + subItemsRect.height

        //母项
        //checkbox, picture and words
        Row {
            id: headerItemRect
            x: 20; y: 2
            width: parent.width
            height: listViewDelegate.itemHeight
            spacing: 15
            Image {
                id: arrow
                anchors.verticalCenter: parent.verticalCenter
                fillMode: "PreserveAspectFit"
                height: 28
                width: 26
                x:740
                source: listViewDelegate.arrow
                opacity: arrow_display
                //当鼠标点击后,箭头图片旋转90度
    //                    rotation: expanded ? 90 : 0
                rotation: listViewDelegate.expanded ? 0 : -90
                smooth: true
                MouseArea {
                    id: mouseRegion
                    anchors.fill: parent
                        onPressed: {
                            expanded = !expanded      //扫描出的子项是否下拉显示的控制变量
                            if(heightMark==listViewDelegate.sub_num){  //通过对heightMark的赋值来实现子项的下拉显示与收缩不显示
                                heightMark=0;
                            }
                            else if(heightMark==0){
                                heightMark=listViewDelegate.sub_num;
                            }
                            listViewDelegate.subpressed(heightMark); //将heightMark的值传给清理界面实现对是否下拉显示子项的控制
                        }
                }
            }
            Common.MainCheckBox{
                id:check
                checked: mstatus//listViewDelegate.main_check_value
                anchors.verticalCenter: parent.verticalCenter
                onCheckedChanged: {
                }
                onClicked: {
                    if(check.checkedbool) {
                        listViewDelegate.checkchanged(true);
                        listViewDelegate.transmitFileItemMainCheckBoxStatus(true);//test 0410
                    }
                    else {
                        listViewDelegate.checkchanged(false);
                        listViewDelegate.transmitFileItemMainCheckBoxStatus(false);//test 0410
                    }
                }
                onSendMstatus: {
                    check.checkedbool = status;
                }
            }
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
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    text: itemTitle
                    font.pointSize: 11
                    color: "black"
                }
                Text {
                    text: detailstr
                    width: 600
                    wrapMode: Text.WordWrap
                    font.family: "URW Bookman L"
                    font.pointSize: 9
                    color: "gray"
                }
            }
        }

        //子项
        Item {
            id: subItemsRect
            property int itemHeight: listViewDelegate.itemHeight
            y: headerItemRect.height + 20
            width: 850 - 2
            clip: true
            //当高度需要扩展时,根据expandedItemCount数目和itemHeight高度去扩展
            height: delegate.expandedItemCount * itemHeight
            opacity: listViewDelegate.expanded ? 1 : 0
            ListView{
                id: subItemRepeater
                width: listViewDelegate.width
                model: sub_model
                delegate: ldelegate
                anchors.fill: parent
            }
            Component{
                id:ldelegate
                FileItem {
                    id: subListItem
                    split_status: listViewDelegate.delegate_flag
                    width: subItemsRect.width
                    height: subItemsRect.itemHeight
//                            text: subItemTitle
                    text: itemTitle
                    descript: desc
                    size_num: number
                    item_index: index
                    //根据主checkbox的状态来更改所有子checkbox的状态：true、false
                    checkbox_status: check.checkedbool
                    fontName: listViewDelegate.subItemFontName
                    fontSize: listViewDelegate.subItemFontSize
                    fontColor: listViewDelegate.subItemFontColor
//                    textIndent: 20
                    btn_flag: listViewDelegate.btn_flag
                    onClicked: {}

                    //test 0410
                    onGetFileItemCheckBoxStatus: {
                        listViewDelegate.transmitFileItemCheckBoxStatus(status, index);
                    }

                    onChange_num: {
                        if(check_status==true) {      //已经勾上的子项数量统计,check_num记录
                            check_num=check_num+1;
                        }
                        else {
                            check_num=check_num-1;
                        }
                        if(sub_num!=0&&heightMark!=0){  //在扫描出子项并下拉显示了子项的前提下,根据已经勾上的子项个数确定总checkbox处于三种状态中的哪种
                            if(check_num ==0) {
                                check.checked="false";
                            }
                            else if(check_num ==sub_num) {
                                check.checked="true";
                            }
                            else {
                                check.checked="mid";
                            }
                        }
                        if(check.checked == "true" || listViewDelegate.check_num > 0) {   //根据是否有勾选项给清理页面传值判断是否能进行清理工作
                            listViewDelegate.checkchanged(true);
                        }
                        else {
                            listViewDelegate.checkchanged(false);
                        }
                    }
                }
            }
        }//子项Item
    }
}//Component


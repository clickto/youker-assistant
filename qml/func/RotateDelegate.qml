import QtQuick 1.1
//import Ubuntu.Components 0.1
//import Ubuntu.Components.ListItems 0.1 as ListItem
import "common" as Common
Component {
    Item {
        id: clearDelegate
        width: parent.width//clearDelegate.ListView.view.width
        height: 65

        function itemClicked() {
            rotateDetails.title = "kobe111";
            rotateDetails.description = "lixiang111";
            scaleMe.state = "Details";
        }

        Item {
            Behavior on scale { NumberAnimation { easing.type: Easing.InOutQuad} }
            id: scaleMe
            //checkbox, picture and words
            Row {
                id: lineLayout
                spacing: 10
//                anchors {
//                    fill: parent
//                    left: parent.left
//                    leftMargin: 50
//                }
                Common.CheckBox {
                    id: checkbox
                    checked: true
                    anchors.verticalCenter: parent.verticalCenter
                    onCheckedChanged: {
                        //kobe: wait for adding function
                    }
                }
                Image {
                    id: clearImage
                    width: 47; height: 47
                    source: picture
                    anchors {
                        left: checkbox.right; leftMargin: 15
                        verticalCenter: parent.verticalCenter
                    }

                }

                Column {
                    spacing: 5
                    anchors {
                        left: clearImage.right; leftMargin: 15
                        verticalCenter: parent.verticalCenter
                    }
                    Text {
                        text: title
                        font.pointSize: 11
                        color: "black"
                    }
                    Text {
                        text: detailstr
                        font.pointSize: 9
                        color: "gray"
                    }
                }
            }
            Rectangle {  //分割条
                width: parent.width; height: 1
                anchors { top: lineLayout.bottom; topMargin: 5}
                color: "gray"
            }
//            ListItem.ThinDivider {} //分割条  can be used as header for list

            Connections {
                target: toolBar
                onButton2Clicked: if (scaleMe.state == 'Details' ) scaleMe.state = 'Show'
            }

            states: [
                State {
                    name: "Show"; when: thumb.status == Image.Ready
                    PropertyChanges { target: scaleMe; scale: 1 }
                },
                State {
                    name: "Details"
                    PropertyChanges { target: scaleMe; scale: 1 }
                    PropertyChanges { target: background; state: "DetailedView" }
                }
            ]
            transitions: [
                Transition {
                    from: "Show"; to: "Details"
                    ParentAnimation {
                        via: foreground
                        NumberAnimation { properties: "x,y"; duration: 500; easing.type: Easing.InOutQuad }
                    }
                },
                Transition {
                    from: "Details"; to: "Show"
                    ParentAnimation {
                        via: foreground
                        NumberAnimation { properties: "x,y"; duration: 500; easing.type: Easing.InOutQuad }
                    }
                }
            ]
        }

        MouseArea {
            anchors.fill: clearDelegate
            onClicked: itemClicked()
        }
        //点击不同的项时移动焦点颜色
    //    MouseArea {
    //        anchors.fill: clearDelegate
    //        onClicked: {
    //            clearDelegate.ListView.view.currentIndex = index
    //        }
    //    }
    }
}



//Component {
//    Item {
//        id: clearDelegate
//        width: parent.width//clearDelegate.ListView.view.width
//        height: 65

//        function itemClicked() {
//            rotateDetails.title = "kobe111";
//            rotateDetails.description = "lixiang111";
//            scaleMe.state = "Details";
//        }

//        Item {
//            Behavior on scale { NumberAnimation { easing.type: Easing.InOutQuad} }
//            id: scaleMe
//            //checkbox, picture and words
//            Row {
//                id: lineLayout
//                spacing: 10
//                anchors {
//                    fill: parent
//                    left: parent.left
//                    leftMargin: 50
//                }
//                CheckBox {
//                    id: checkbox
//                    checked: true
//                    anchors.verticalCenter: parent.verticalCenter
//                    onCheckedChanged: {
//                        //kobe: wait for adding function
//                    }
//                }
//                Image {
//                    id: clearImage
//                    width: 47; height: 47
//                    source: picture
//                    anchors {
//                        left: checkbox.right; leftMargin: 15
//                        verticalCenter: parent.verticalCenter
//                    }

//                }

//                Column {
//                    spacing: 5
//                    anchors {
//                        left: clearImage.right; leftMargin: 15
//                        verticalCenter: parent.verticalCenter
//                    }
//                    Text {
//                        text: title
//                        font.pointSize: 11
//                        color: "black"
//                    }
//                    Text {
//                        text: detailstr
//                        font.pointSize: 9
//                        color: "gray"
//                    }
//                }
//            }
//            ListItem.ThinDivider {} //分割条  can be used as header for list

//            Connections {
//                target: toolBar
//                onButton2Clicked: if (scaleMe.state == 'Details' ) scaleMe.state = 'Show'
//            }

//            states: [
//                State {
//                    name: "Show"; when: thumb.status == Image.Ready
//                    PropertyChanges { target: scaleMe; scale: 1 }
//                },
//                State {
//                    name: "Details"
//                    PropertyChanges { target: scaleMe; scale: 1 }
//                    PropertyChanges { target: background; state: "DetailedView" }
//                }
//            ]
//            transitions: [
//                Transition {
//                    from: "Show"; to: "Details"
//                    ParentAnimation {
//                        via: foreground
//                        NumberAnimation { properties: "x,y"; duration: 500; easing.type: Easing.InOutQuad }
//                    }
//                },
//                Transition {
//                    from: "Details"; to: "Show"
//                    ParentAnimation {
//                        via: foreground
//                        NumberAnimation { properties: "x,y"; duration: 500; easing.type: Easing.InOutQuad }
//                    }
//                }
//            ]
//        }

//        MouseArea {
//            anchors.fill: clearDelegate
//            onClicked: itemClicked()
//        }
//        //点击不同的项时移动焦点颜色
//    //    MouseArea {
//    //        anchors.fill: clearDelegate
//    //        onClicked: {
//    //            clearDelegate.ListView.view.currentIndex = index
//    //        }
//    //    }
//    }
//}












//Component {
//    Item {
//        id: clearDelegate
//        width: parent.width//clearDelegate.ListView.view.width
//        height: 65
//        //checkbox, picture and words
//        Row {
//            id: lineLayout
//            spacing: 10
//            anchors {
//                fill: parent
//                left: parent.left
//                leftMargin: 50
//            }

//            CheckBox {
//                id: checkbox
//                checked: true
//                anchors.verticalCenter: parent.verticalCenter
//                onCheckedChanged: {
//                    //kobe: wait for adding function
//                }
//            }

//            Image {
//                id: clearImage
//                width: 47; height: 47
//                source: picture
//                anchors {
//                    left: checkbox.right; leftMargin: 15
//                    verticalCenter: parent.verticalCenter
//                }

//            }

//            Column {
//                spacing: 5
//                anchors {
//                    left: clearImage.right; leftMargin: 15
//                    verticalCenter: parent.verticalCenter
//                }
//                Text {
//                    text: title
//                    font.pointSize: 11
//                    color: "black"
//                }
//                Text {
//                    text: detailstr
//                    font.pointSize: 9
//                    color: "gray"
//                }
//            }
//        }
//        ListItem.ThinDivider {} //分割条  can be used as header for list

//        //点击不同的项时移动焦点颜色
//    //    MouseArea {
//    //        anchors.fill: clearDelegate
//    //        onClicked: {
//    //            clearDelegate.ListView.view.currentIndex = index
//    //        }
//    //    }
//    }
//}

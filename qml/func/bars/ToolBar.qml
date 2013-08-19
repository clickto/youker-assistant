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
import "../common" as Common
Item {
     id: toolbar
     property bool showok: true
     signal quitBtnClicked
     signal okBtnClicked

     BorderImage {
//         source: "../../img/icons/tab.png"
         width: parent.width; height: parent.height + 14; y: -7
     }

     Rectangle{id: splitbar; x:2; width:parent.width - 4 ; height:1; color:"#b9c5cc"}

     Row {
         spacing: 30
         height: 32
         anchors {
             right: parent.right
             rightMargin: 5
             top: splitbar.bottom
             topMargin: 10
         }

//         anchors.right: parent.right; anchors.rightMargin: 5; y: 3; height: 32; spacing: 30
         Common.Button {
             id: okBtn
             visible: toolbar.showok
             hoverimage: "../../img/icons/ok.png"
             width: 94; height: 29
             onClicked: toolbar.okBtnClicked()
         }
         Common.Button {
             id: quitBtn
             hoverimage: "../../img/icons/back.png"
             width: 94; height: 29
             onClicked: toolbar.quitBtnClicked()
         }
     }
}
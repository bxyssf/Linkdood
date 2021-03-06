import QtQuick 2.0
import com.syberos.basewidgets 2.0

CPage {
    id: userdataPage    

    onStatusChanged: {
        if (status === CPageStatus.WillShow) {
            userdataPage.statusBarHoldEnabled = true
            gScreenInfo.setStatusBar(userdataPage.statusBarHoldEnabled)
            userdataPage.statusBarHoldItemColor = "#edf0f0"
            gScreenInfo.setStatusBarStyle("black")
        }
    }
    contentAreaItem:Item {
        anchors.fill :parent
        Rectangle {
            id: userdataBackground
            anchors.fill: parent
            color: "#f2f2f2"
        }
        Rectangle{
            id: titleBackground

            color:"#003953"
            width:parent.width
            height:86
            anchors{
                top:parent.top
                left:parent.left
            }
            IconButton{
                id:btnBack
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    pageStack.pop();
                }
            }
            Text{
                text:qsTr("详细资料")
                color:"white"
                font.pixelSize: 36
                anchors.centerIn: parent
            }
        }
        Rectangle{
            id:userdatapic
            anchors.top:titleBackground.bottom
            height:309
            width:parent.width
            color: "#f2f2f2"
            Image{
                id:headimagebackgroud
                width:parent.width
                anchors.top:parent.top
                height:215
                z: 5
                source: "qrc:/res/descbgtop.jpg"
                Text{
                    id:username
                    anchors.bottom: parent.bottom
                    anchors.left:parent.left
                    anchors{
                        leftMargin: 210
                        bottomMargin: 24
                    }
                    text:userdataManager.name
                    color:"white"
                    font.pixelSize: 36
                }
            }
            Image{
                id:headImage
                anchors.top:parent.top
                anchors.left:parent.left
                width:160
                height: 160
                anchors{
                    topMargin:138
                    leftMargin:36
                }
                z:10
                    source:"qrc:/res/logo.png"
            }
            CLine {
                width: parent.width
                z: parent.z+10

                anchors.bottom: parent.bottom
            }
        }
        Rectangle{
            id:userdata
            width: parent.width
            anchors.top:userdatapic.bottom
            color:"white"
            height: 249
            Rectangle{
                id:name
                width: parent.width
                anchors.top:parent.top
                height: 83
                Text{
                    anchors{
                        left:parent.left
                        leftMargin:39
                        verticalCenter: parent.verticalCenter
                    }

                    text:qsTr("姓名")
                    font.pixelSize: 30
                }
                Text{
                    anchors{
                        right:parent.right
                        rightMargin:20
                        verticalCenter: parent.verticalCenter
                    }

                    text:userdataManager.name
                    font.pixelSize: 30
                }
                CLine {
                    width: parent.width
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 39
                    z: parent.z+10

                    anchors.bottom: parent.bottom
                }
            }
            Rectangle{
                id:sex
                width: parent.width
                anchors.top:name.bottom
                height: 83
                Text{
                    anchors{
                        left:parent.left
                        leftMargin:39
                        verticalCenter: parent.verticalCenter
                    }

                    text:qsTr("性别")
                    font.pixelSize: 30
                }
                Text{
                    anchors{
                        right:parent.right
                        rightMargin:20
                        verticalCenter: parent.verticalCenter
                    }

                    text:userdataManager.gender
                    font.pixelSize: 30
                    onTextChanged: {
                        console.log("XXXXXXXXXXXXXXX:"+userdataManager.gender)
                    }
                }
                CLine {
                    width: parent.width
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 39
                    z: parent.z+10

                    anchors.bottom: parent.bottom
                }
            }
            Rectangle{
                id:phone
                width: parent.width
                anchors.top:sex.bottom
                height: 83
                Text{
                    anchors{
                        left:parent.left
                        leftMargin:39
                        verticalCenter: parent.verticalCenter
                    }

                    text:qsTr("联系方式")
                    font.pixelSize: 30
                }
                Text{
                    anchors{
                        right:parent.right
                        rightMargin:20
                        verticalCenter: parent.verticalCenter
                    }

                    text:qsTr("")
                    font.pixelSize: 30
                }
                CLine {
                    width: parent.width
                    anchors.left: parent.left
                    anchors.right: parent.right
                    z: parent.z+10

                    anchors.bottom: parent.bottom
                }
            }
        }
        CButton{
            id:sendmessage
            anchors.top:userdata.bottom
            width: parent.width
            anchors.topMargin: 147
            height: 83
            backgroundComponent: Rectangle {
                anchors.fill: parent
                color:"white"
            }
            Text{
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                color:"blue"
                font.pixelSize: 32
                text:qsTr("发消息")
            }
            onClicked: {
                chatManager.showChatPage(userdataManager.name, userdataManager.id,
                                         "1", userdataManager.thumbAvatar)
            }
        }

    }

}

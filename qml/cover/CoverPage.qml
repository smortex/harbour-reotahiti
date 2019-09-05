import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Column {
        anchors.centerIn: parent
        spacing: Theme.paddingMedium

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "here"
        }
        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "aimer"
            color: Theme.highlightColor
        }
    }

    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: "image://theme/icon-cover-previous"
        }

        CoverAction {
            iconSource: "image://theme/icon-cover-next"
        }
    }
}

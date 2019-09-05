import QtQuick 2.5
import Sailfish.Silica 1.0

Page {
    id: page

    property QtObject rootWindow: null

    property string subject
    property variant words: []

    Component.onCompleted: {
        words.forEach(function (e) {
            wordList.append(e)
        })
    }

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All


    SilicaListView {
        anchors.fill: parent

        header: PageHeader {
            title: subject
        }

        model: ListModel {
            id: wordList
        }

        delegate: ListItem {
            width: ListView.view.width
            height: Theme.itemSizeSmall

            Label {
                id: label
                text: word
                anchors.verticalCenter: parent.verticalCenter
                x: Theme.horizontalPageMargin
            }

            onClicked: {
                if (subject == translation)
                    rootWindow.query();
                else {
                    label.text = word + " (" + translation + ")"
                    label.color = 'red'
                }
            }
        }
    }
}

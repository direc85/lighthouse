import QtQuick 2.0
import Sailfish.Silica 1.0

BackgroundItem {

    property bool withName: true
    property int cpuUse
    property int memUse
    property string procName
    property bool largeScreen: Screen.sizeCategory === Screen.Large ||
                               Screen.sizeCategory === Screen.ExtraLarge

    anchors {
        left: parent.left
        right: parent.right
    }

    height: greyBar.height

    Label {
        visible: withName
        anchors {
            left: parent.left
            right: greyBar.left
            leftMargin: Theme.paddingLarge
            rightMargin: Theme.paddingSmall
            verticalCenter: parent.verticalCenter
        }
        truncationMode: TruncationMode.Fade
        id: itemLabel
        text: procName
    }

    Text {
        id: cpuLabel
        z: 99
        text: qsTr("cpu: ") + cpuUse + "%"
        color: Theme.primaryColor
        font.pointSize: largeScreen ? Theme.fontSizeSmall : Theme.fontSizeExtraSmall
        anchors {
            horizontalCenter: greyBar.horizontalCenter
            top: parent.top
        }
    }

    Text {
        id: memLabel
        text: qsTr("mem: ") + memUse + "%"
        z: 99
        color: Theme.secondaryColor
        font.pointSize: largeScreen ? Theme.fontSizeSmall : Theme.fontSizeExtraSmall
        anchors {
            horizontalCenter: greyBar.horizontalCenter
            top: parent.top
            topMargin: cpuLabel.height + 1
        }
    }

    Canvas {
        id: greyBar
        anchors {
            right: parent.right
            top: parent.top
            rightMargin: Theme.paddingLarge
        }

        width: withName ? parent.width / 2.0 - Theme.paddingLarge : parent.width - 2*Theme.paddingLarge
        height: cpuLabel.height + memLabel.height + 1
        onPaint: {
            var context = getContext("2d");

            context.beginPath()
            context.clearRect(0, 0, width, height)
            context.fill()

            context.fillStyle = 'rgba(27%, 27%, 27%, 0.5)'
            context.beginPath()
            context.fillRect(0, 0, width, height)
            context.fill()
        }
    }

    Rectangle {
        id: cpuBar
        anchors {
            right: parent.right
            top: parent.top
            rightMargin: Theme.paddingLarge
        }

        width: cpuUse / 100.0 * greyBar.width
        height: cpuLabel.height
        color: Theme.highlightColor
    }

    Rectangle {
        id: memBar
        anchors {
            right: parent.right
            top: parent.top
            topMargin: cpuBar.height + 1
            rightMargin: Theme.paddingLarge
        }

        width: memUse / 100.0 * greyBar.width
        height: memLabel.height
        color: Theme.secondaryHighlightColor
    }
}

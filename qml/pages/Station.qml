/*
* Copyright (c) 2016 Shane Quigley
*
* This software is MIT licensed see link for details
* http://www.opensource.org/licenses/MIT
*
* @author Shane Quigley
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
Page {
    id: page

    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: "Open Location"
                onClicked: {
                    var current =  Qt.dublinBikes.stations()[Qt.dublinBikes.current],
                        loc = current.latitude + "," + current.longitude;
                    Qt.openUrlExternally("geo:" + loc);
                }
            }
        }

        contentHeight: column.height
        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: Qt.dublinBikes.stations()[Qt.dublinBikes.current].name
            }
            Text {
                width: parent.width - 2*Theme.paddingLarge
                x: Theme.paddingLarge
                color: Theme.secondaryColor
                wrapMode: Text.Wrap
                textFormat: Text.StyledText
                horizontalAlignment: Text.AlignHCenter
                linkColor: Theme.highlightColor
                font.pixelSize: Theme.fontSizeSmall
                onLinkActivated: Qt.openUrlExternally(link)
                text: "<strong>Free Bikes:</strong> " + Qt.dublinBikes.stations()[Qt.dublinBikes.current].free_bikes + "<br><br>" +
                    "<strong>Free Spaces:</strong> " + Qt.dublinBikes.stations()[Qt.dublinBikes.current].empty_slots + "<br><br>" +
                    "<strong>Last Updated:</strong> " + Qt.dublinBikes.stations()[Qt.dublinBikes.current].timestamp.split("T")[1].substring(0, 8) + "<br><br>
"
            }
        }
    }
}

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
import "../dublinbikes.js" as DublinBikes

Page {
    id: page
    property bool loading: false

    BusyIndicator {
        anchors.centerIn: parent
        running: page.loading
        visible: page.loading
    }

    SilicaListView {
        id: listView
        visible: !page.loading
        PullDownMenu {
            MenuItem {
                text: "About"
                onClicked: {
                    pageStack.replace(Qt.resolvedUrl("About.qml"));
                }
            }
            MenuItem {
                text: "Refresh"
                onClicked: {
                    page.loading = true;
                    Qt.dublinBikes = DublinBikes.api;
                    Qt.dublinBikes.loadStationData(function () {
                        page.loading = false;
                        pageStack.replace(Qt.resolvedUrl("Stations.qml"));
                    }, function () {

                    });
                }
            }
        }

        model: Qt.dublinBikes.stations().length
        anchors.fill: parent
        header: PageHeader {
            title: "Stations"
        }
        delegate: BackgroundItem {
            id: delegate

            Label {
                x: Theme.paddingLarge
                text: Qt.dublinBikes.stations()[index].name + " - " + Qt.dublinBikes.stations()[index].free_bikes + "/" + (Qt.dublinBikes.stations()[index].empty_slots + Qt.dublinBikes.stations()[index].free_bikes)
                anchors.verticalCenter: parent.verticalCenter
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            onClicked: {
                page.loading = true;
                //TODO: Chnage page
            }
        VerticalScrollDecorator {}
        }
    }


}

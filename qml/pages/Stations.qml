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
    property bool loading: Qt.dublinBikes.loading

    function load() {
        page.loading = true;
        Qt.dublinBikes = DublinBikes.api;
        Qt.dublinBikes.loadStationData(function () {
            page.loading = false;
            pageStack.replace(Qt.resolvedUrl("Stations.qml"));
        }, function () {
            pageStack.push(Qt.resolvedUrl("ErrorPage.qml"));
        });
    }

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
                    pageStack.push(Qt.resolvedUrl("About.qml"));
                }
            }
            MenuItem {
                text: "Refresh"
                onClicked: load()
            }
        }

        model: Qt.dublinBikes && Qt.dublinBikes.stations().length
        anchors.fill: parent
        header: PageHeader {
            title: "Stations"
        }
        delegate: BackgroundItem {
            id: delegate

            Label {
                x: Theme.paddingLarge
                text: Qt.dublinBikes.getStationString(index)
                anchors.verticalCenter: parent.verticalCenter
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            onClicked: {
                Qt.dublinBikes.current = index;
                Qt.dublinBikes.coverString = Qt.dublinBikes.getStationString(index).replace(" - ", "<br>").replace(/\s/g, "<br>");
                pageStack.push(Qt.resolvedUrl("Station.qml"));
            }
        VerticalScrollDecorator {}
        }
    }

    Component.onCompleted:load()
}

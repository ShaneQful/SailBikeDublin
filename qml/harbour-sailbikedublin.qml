
import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"
import "dublinbikes.js" as DublinBikes

ApplicationWindow
{
    initialPage: Component {
        Stations { }
    }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: Orientation.All
    _defaultPageOrientations: Orientation.All
}



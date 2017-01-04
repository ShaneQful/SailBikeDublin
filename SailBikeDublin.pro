# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-sailbikedublin

CONFIG += sailfishapp

SOURCES += src/harbour-sailbikedublin.cpp

OTHER_FILES += qml/harbour-sailbikedublin.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-sailbikedublin.changes.in \
    rpm/harbour-sailbikedublin.spec \
    rpm/harbour-sailbikedublin.yaml \
    translations/*.ts \
    harbour-sailbikedublin.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

DISTFILES += \
    qml/pages/Stations.qml \
    qml/pages/ErrorPage.qml \
    qml/dublinbikes.js \
    qml/pages/About.qml \
    qml/pages/Station.qml


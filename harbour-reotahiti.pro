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
TARGET = harbour-reotahiti

CONFIG += sailfishapp_qml

DISTFILES += qml/harbour-reotahiti.qml \
    qml/cover/CoverPage.qml \
    qml/pages/MainPage.qml \
    qml/pages/SelectTranslation.qml \
    qml/prototypes.js \
    rpm/harbour-reotahiti.changes.in \
    rpm/harbour-reotahiti.changes.run.in \
    rpm/harbour-reotahiti.spec \
    rpm/harbour-reotahiti.yaml \
    translations/*.ts \
    harbour-reotahiti.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

TRANSLATIONS += translations/harbour-reotahiti-fr.ts \
    translations/harbour-reotahiti-ty.ts

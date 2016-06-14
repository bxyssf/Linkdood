#-------------------------------------------------
#
# Project generated by QtCreator for SyberOS.
#
#-------------------------------------------------

# This is needed for using syberos-application module
include(../syberos.pri)

QT += gui qml quick
TARGET = linkdoodui
TEMPLATE = app

CONFIG += link_pkgconfig qml_debug
PKGCONFIG += syberos-application syberos-application-cache

RESOURCES += qml.qrc images.qrc

HEADERS += src/linkdoodui_workspace.h

SOURCES += src/main.cpp \
		   src/linkdoodui_workspace.cpp

OTHER_FILES += qml/*.qml

target.path = $$INSTALL_DIR/bin

res.files = res
res.path = $$INSTALL_DIR/

INSTALLS += target res

DISTFILES += \
    qml/CDoodLoginPage.qml

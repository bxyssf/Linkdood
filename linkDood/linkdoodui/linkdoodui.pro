#-------------------------------------------------
#
# Project generated by QtCreator for SyberOS.
#
#-------------------------------------------------

# This is needed for using syberos-application module
include(../syberos.pri)

QT += qml quick dbus multimedia gui-private
QT       += sensors

TARGET = linkdoodui
TEMPLATE = app

CONFIG += link_pkgconfig qml_debug
PKGCONFIG += syberos-application syberos-application-cache

INCLUDEPATH += ../linkdoodclient
LIBS += -L../linkdoodclient
LIBS += -llinkdoodclient
QMAKE_LFLAGS += -Wl,-rpath=$$LIB_DIR -Wl,-Bsymbolic

RESOURCES += qml.qrc images.qrc

HEADERS += src/linkdoodui_workspace.h \
    src/cdoodlistmodel.h \
    src/cdoodloginmanager.h \
    src/cdoodsessionlistmanager.h \
    src/cdoodsessionlistitem.h \
    src/cdoodcontactitem.h \
    src/cdoodcontactmanager.h \
    src/cdoodenterprisemanager.h\
    src/cdoodchatmanager.h\
    src/cdooduserdatamanage.h \
    src/cdoodchatitem.h \
    src/cdoodorgitem.h \
    src/cdoodorguseritem.h \
    src/cdoodorgmanager.h

SOURCES += src/main.cpp \
		   src/linkdoodui_workspace.cpp \
    src/cdoodlistmodel.cpp \
    src/cdoodloginmanager.cpp \
    src/cdoodsessionlistmanager.cpp \
    src/cdoodsessionlistitem.cpp \
    src/cdoodcontactitem.cpp \
    src/cdoodcontactmanager.cpp \
    src/cdoodenterprisemanager.cpp\
    src/cdoodchatmanager.cpp\
    src/cdooduserdatamanage.cpp \
    src/cdoodchatitem.cpp \
    src/cdoodorgitem.cpp \
    src/cdoodorguseritem.cpp \
    src/cdoodorgmanager.cpp
OTHER_FILES += qml/*.qml

target.path = $$INSTALL_DIR/bin

res.files = res
res.path = $$INSTALL_DIR/

INSTALLS += target res

DISTFILES += \
    qml/CDoodLoginPage.qml \
    qml/CDoodTabViewStyle.qml \
    qml/CDoodSessionListPage.qml \
    qml/CDoodContactRootPage.qml \
    qml/CDoodRootTabView.qml \
    qml/CDoodHeaderImage.qml \
    qml/CDoodUserDataPage.qml \
    qml/CDoodChatDelegate.qml \
    qml/CDoodSendTextMessageCompoent.qml \
    qml/CDoodReceiveTextMessageCompoent.qml \
    qml/CDoodContactMainPage.qml \
    qml/CDoodEnterprise.qml \
    qml/CDoodTabViewEnterStyle.qml

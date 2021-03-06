#-------------------------------------------------
#
# Project generated by QtCreator for SyberOS.
#
#-------------------------------------------------

# This is needed for using syberos-application module
include(../syberos.pri)

QT += core

QT += dbus

TARGET = linkdoodservice
TEMPLATE = app

CONFIG += link_pkgconfig
CONFIG += c++11

PKGCONFIG += syberos-application syberos-application-cache
PKGCONFIG += syberos-qt
INCLUDEPATH += linkdood_sdk/include/data
INCLUDEPATH += linkdood_sdk/include/interface
INCLUDEPATH += linkdood_sdk/include/utils
INCLUDEPATH += ../linkdoodclient

LIBS += -L$$PWD/linkdood_sdk
LIBS += -L../linkdoodclient

LIBS += -lcurl -limsdkapi -limswift -llogicMgr -lservice -llinkdoodclient

QMAKE_LFLAGS += -Wl,-rpath=$$LIB_DIR -Wl,-Bsymbolic


HEADERS += linkdoodservice_workspace.h \
    linkdoodservice.h \
    authcontroler.h \
    linkdood_sdk/include/data/Account.h \
    linkdood_sdk/include/data/Chat.h \
    linkdood_sdk/include/data/Contact.h \
    linkdood_sdk/include/data/ErrorInfo.hpp \
    linkdood_sdk/include/data/Group.h \
    linkdood_sdk/include/data/LoginInfo.hpp \
    linkdood_sdk/include/data/Member.h \
    linkdood_sdk/include/data/Msg.h \
    linkdood_sdk/include/data/Org.h \
    linkdood_sdk/include/data/packet.h \
    linkdood_sdk/include/data/ReqLoginParamBean.hpp \
    linkdood_sdk/include/data/SDKTypes.h \
    linkdood_sdk/include/data/SysMsg.h \
    linkdood_sdk/include/data/TinyGroup.h \
    linkdood_sdk/include/data/User.h \
    linkdood_sdk/include/interface/IAuthObserver.h \
    linkdood_sdk/include/interface/IAuthService.h \
    linkdood_sdk/include/interface/IChatObserver.h \
    linkdood_sdk/include/interface/IChatService.h \
    linkdood_sdk/include/interface/IContactObserver.h \
    linkdood_sdk/include/interface/IContactService.h \
    linkdood_sdk/include/interface/IEnterpriseService.h \
    linkdood_sdk/include/interface/IFileService.h \
    linkdood_sdk/include/interface/IGroupObserver.h \
    linkdood_sdk/include/interface/IGroupService.h \
    linkdood_sdk/include/interface/IMClient.h \
    linkdood_sdk/include/interface/INotifyService.h \
    linkdood_sdk/include/interface/ISearchService.h \
    linkdood_sdk/include/interface/ISysMsgObserver.h \
    linkdood_sdk/include/interface/ISysMsgService.h \
    linkdood_sdk/include/interface/ISysSetService.h \
    linkdood_sdk/include/utils/FileUtils.h \
    linkdood_sdk/include/utils/MsgUtils.h \
    contactcontroler.h \
    chatcontroler.h \
    sysmsgcontroler.h \
    enterprisecontroler.h \
    linkdoodservicethread.h

SOURCES += main.cpp \
	   linkdoodservice_workspace.cpp \
    linkdoodservice.cpp \
    authcontroler.cpp \
    contactcontroler.cpp \
    chatcontroler.cpp \
    sysmsgcontroler.cpp \
    enterprisecontorler.cpp \
    linkdoodservicethread.cpp

target.path = $$INSTALL_DIR/bin

sdklibs.files += $$PWD/linkdood_sdk/libcurl.so
sdklibs.files += $$PWD/linkdood_sdk/libimsdkapi.so
sdklibs.files += $$PWD/linkdood_sdk/libimswift.so
sdklibs.files += $$PWD/linkdood_sdk/liblogicMgr.so
sdklibs.files += $$PWD/linkdood_sdk/libservice.so
sdklibs.files += $$PWD/linkdood_sdk/libservice.so.1

sdklibs.path = $$INSTALL_DIR/libs/

sdkcrt.files += $$PWD/linkdood_sdk/linkdood.crt
sdkcrt.path = $$INSTALL_DIR/crt/

INSTALLS += target sdklibs sdkcrt

#include "linkdoodui_workspace.h"
#include "cdoodlistmodel.h"
#include "cdoodloginmanager.h"
#include "linkdoodclient.h"

#include <QQmlContext>
#include <QDebug>

linkdoodui_Workspace::linkdoodui_Workspace()
    : CWorkspace()
{
    qmlRegisterType<CDoodListModel>("CDoodListModel", 1, 0, "CDoodListModel");

    m_pClient = QSharedPointer<LinkDoodClient>(new LinkDoodClient());
    if (!m_pClient.data()) {
        qDebug() << Q_FUNC_INFO << "m_pClient init error !!!";
    }

    m_pLoginManager = QSharedPointer<CDoodLoginManager>(new CDoodLoginManager(m_pClient.data()));
    if (!m_pLoginManager.data()) {
        qDebug() << Q_FUNC_INFO << "m_pLoginManager init error !!!";
    }

    m_view = SYBEROS::SyberosGuiCache::qQuickView();
    QObject::connect(m_view->engine(), SIGNAL(quit()), qApp, SLOT(quit()));
    m_view->engine()->rootContext()->setContextProperty("loginManager", m_pLoginManager.data());
    m_view->setSource(QUrl("qrc:/qml/main.qml"));
    m_view->showFullScreen();
}

void linkdoodui_Workspace::onLaunchComplete(Option option, const QStringList& params)
{
    Q_UNUSED(params)
    qDebug() << Q_FUNC_INFO;
    qApp->runService("linkdoodservice", QStringList());

    switch (option) {
    case CWorkspace::HOME:
        qDebug()<< "Start by Home";
        break;
    case CWorkspace::URL:
        break;
    case CWorkspace::EVENT:
        break;
    case CWorkspace::DOCUMENT:
        break;
    default:
        break;
    }
}


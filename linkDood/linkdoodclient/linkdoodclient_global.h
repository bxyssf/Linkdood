#ifndef LINKDOODCLIENT_GLOBAL_H
#define LINKDOODCLIENT_GLOBAL_H

#include <QtCore/qglobal.h>

#if defined(LINKDOODCLIENT_LIBRARY)
#  define LINKDOODCLIENTSHARED_EXPORT Q_DECL_EXPORT
#else
#  define LINKDOODCLIENTSHARED_EXPORT Q_DECL_IMPORT
#endif

#endif // LINKDOODCLIENT_GLOBAL_H

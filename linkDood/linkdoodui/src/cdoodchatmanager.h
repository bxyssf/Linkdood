#ifndef CDOODCHATMANAGER_H
#define CDOODCHATMANAGER_H

#include <QObject>

#include "cdoodlistmodel.h"
#include "linkdoodclient.h"

class CDoodChatItem;

class CDoodChatManager : public CDoodListModel
{
    Q_OBJECT
    Q_PROPERTY(QString id READ id WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)

public:
    explicit CDoodChatManager(LinkDoodClient *client = 0, QObject *parent = 0);

    ~CDoodChatManager();

    //发送消息
    Q_INVOKABLE void sendText(QString text);
    Q_INVOKABLE void sendMessage(Msg msg);
    //获取消息
    Q_INVOKABLE void getMessages(QString targetid, int count);

    //移除会话
    Q_INVOKABLE void removeChat(QString targetid);
    //设置消息已读
    Q_INVOKABLE void setMessageRead(QString targetid);
    //获取未读消息列表
    void getUnReadMessages(void);
    //删除消息
    void deleteMessage(QString targetid, QStringList msgs);

    QString id()const;
    QString name()const;

    Q_INVOKABLE void   setId(const QString&id);
    Q_INVOKABLE void   setName(const QString&name);

    Q_INVOKABLE void entryChat(const QString &targetid);
    Q_INVOKABLE void exitChat();
    Q_INVOKABLE void deleteMessageListItem();

    Q_INVOKABLE void showChatPage(QString chatName,
                                  QString targetid,
                                  QString chatType,
                                  QString icon = QString());

    Q_INVOKABLE void initChatState();

signals:
    //会话列表头像更新
    void chatAvatarChanged(int64 id,QString avatar);
    //监听离线消息通知
    void offlineMsgNotice(IMOfflineMsgList msgList);
    //监听新消息通知
    void newMessageNotice(Msg& msg);
    //发送消息返回
    void sendMessageResult(bool code,QString sendTime,QString msgId);
    //获取消息结果返回
    void getMessagesResult(bool code,QString sessionId,MsgList msgList);
    //移除会话结果返回
    void removeChatResult(bool);

    void idChanged();
    void nameChanged();

    void sendShowChatPage(QString chatName,
                          QString targetid,
                          QString chatType,
                          QString icon);

private slots:
    //会话列表头像更新
    void onChatAvatarChanged(int64 id,QString avatar);
    //监听离线消息通知
    void onChatOfflineMsgNotice(IMOfflineMsgList msgList);
    //监听新消息通知
    void onChatMessageNotice(Msg msg);
    //发送消息返回
    void onChatSendMessageResult(bool code,QString sendTime,QString msgId);
    //获取消息结果返回
    void onChatGetMessagesResult(bool code,QString sessionId,MsgList msgList);
    //移除会话结果返回
    void onChatRemoveChatResult(bool code);
    //移除消息结果返回
    void onChatDeleteMessagesResult(int code);

private:
    void initConnect();

    void analyticalMessage(MsgList list);

    void addItemToListViewModel(Msg msg);

private:
    QString mId;
    QString mName;
    QString m_sBeginMsgId;
    QString m_sTargetid;
    QDateTime m_oLastMessageTime;
    LinkDoodClient *m_pClient;
    QMap<QString, CDoodChatItem*> m_oChatMap;
};

#endif // CDOODCHATMANAGER_H

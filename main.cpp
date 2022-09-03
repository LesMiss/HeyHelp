#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include <QQmlComponent>
#include <QSessionManager>
#include <QQuickStyle>
#include <QFile>
#include <QQuickView>


// my imports
#include <Logic/settings/user_keys/userkeys.h>
#include "Logic/textField/tfchangecolor.h"
#include "Logic/textField/tfonactivechangecolor.h"
#include "Logic/json/userkeysstorage.h"
#include <Logic/keyGeneration/keygenerator.h>
#include <Logic/newEnctyptMessages/encryptionmessages.h>
#include <Logic/messagesSendinglogic/sendDataInDataBase.h>
#include <Logic/messagesSendinglogic/observedatainmessagestableview.h>
#include <Logic/getCurrentUid/getcurrentuid.h>

#include <userModel/messagemodel.h>
#include <userModel/usermodel.h>

#include "server-sockets/tcpclient.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/images/logo/05.png"));

    // Set and observe all users (file: messagemodel.cpp/.h, MessagePage.qml) -->
    qmlRegisterType< messagemodel >("MessageModel", 1, 0, "MessageModelList");

    // Set and observe all users (file: userModel.cpp/.h, MessagePage.qml) -->
    qmlRegisterType< UserModel >("UserModel", 1, 0, "UserModeList");

    // Set change colors to password (file: tfchangecolor.cpp/.h, smarttextfield.qml) -->
    qmlRegisterType<  TFChangeColor > ("SmartChangeColor", 1, 0, "TFChangeColor");

    // Set change colors to password (file: tfonactive.cpp/.h, customtextfield.qml) -->
    qmlRegisterType< TFOnActiveChangeColor > ("CustomChangeColor", 1, 0, "TFOnActiveChangeColor");

    qmlRegisterType< keyGenerator >("keyGenerator", 1, 0, "GetKeys");

    qmlRegisterType< userKeysStorage >("userKeysStorage", 1, 0, "UserKeys");

    // Set inbox, inbox_participants, messages (file: messagessendinglogic.cpp/.h, messagessendinglogic.qml) -->
    qmlRegisterType< sendDataInDataBase >("messagesSendingLogic", 1, 0, "MessagesLogic");

    // Set inbox, inbox_participants, messages (file: messagessendinglogic.cpp/.h, messagessendinglogic.qml) -->
    qmlRegisterType< getCurrentUid >("getCurrentUid", 1, 0, "CurrentUid");

    // check register
    userKeysStorage storage;
    UserModel model;
    QString currentRegisterPass;

    if (storage.observePublicKey() == model.observeKeys()) {
        currentRegisterPass = "qrc:/allPages/mainWindow/MainWindow.qml";
        qDebug() << "true";
    } else {
        currentRegisterPass = "qrc:/main.qml";
        qDebug() << "false";
    }

    QQmlApplicationEngine engine;
    const QUrl url(currentRegisterPass);
//    const QUrl url(QStringLiteral("qrc:/allPages/mainWindow/MainWindow.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

//    encryptionMessages message;
//    engine.rootContext()->setContextProperty("server", &message);

    sendDataInDataBase connection;

    messagemodel modelMsg;
    engine.rootContext()->setContextProperty("myModel", &modelMsg);

    // ------------------------------------------------------------------------------ NEW  ------------------------------------------------------------------------------
    TcpClient tcpClient;
    tcpClient.connectToServer("127.0.0.1", "45000");
    engine.rootContext()->setContextProperty("client", &tcpClient);
    // ------------------------------------------------------------------------------ NEW  ------------------------------------------------------------------------------

    return app.exec();
}



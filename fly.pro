QT += qml quick sql widgets quickcontrols2 core network

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        Logic/addOrCloseDataBase/connectiondatabase.cpp \
        Logic/getCurrentUid/getcurrentuid.cpp \
        Logic/keyGeneration/keygenerator.cpp \
        Logic/json/userkeysstorage.cpp \
        Logic/messagesSendinglogic/observedatainmessagestableview.cpp \
        Logic/messagesSendinglogic/sendDataInDataBase.cpp \
        Logic/newEnctyptMessages/encryptionmessages.cpp \
        Logic/uidGenerator/uidgenerator.cpp \
        Logic/textField/tfchangecolor.cpp \
        Logic/textField/tfonactivechangecolor.cpp \
        main.cpp \
        Logic/settings/user_keys/userkeys.cpp \
        server-sockets/tcpclient.cpp \
        userModel/messagemodel.cpp \
        userModel/usermodel.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    Logic/addOrCloseDataBase/connectiondatabase.h \
    Logic/getCurrentUid/getcurrentuid.h \
    Logic/keyGeneration/keygenerator.h \
    Logic/json/userkeysstorage.h \
    Logic/messagesSendinglogic/observedatainmessagestableview.h \
    Logic/messagesSendinglogic/sendDataInDataBase.h \
    Logic/newEnctyptMessages/encryptionmessages.h \
    Logic/uidGenerator/uidgenerator.h \
    Logic/textField/tfchangecolor.h \
    Logic/textField/tfonactivechangecolor.h \
    Logic/settings/user_keys/userkeys.h \
    filer/filter.h \
    server-sockets/tcpclient.h \
    userModel/messagemodel.h \
    userModel/usermodel.h

DISTFILES += \
    sockets/easywsclient-master/COPYING \
    sockets/easywsclient-master/Makefile \
    sockets/easywsclient-master/README.md \
    sockets/easywsclient-master/example-server.js \
    sockets/easywsclient-master/package.json

# mac windows linux
win32:CONFIG(release, debug|release): LIBS += -L$$PWD/cryptopp/release/ -lcryptopp
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/cryptopp/debug/ -lcryptopp
else:unix: LIBS += -L$$PWD/cryptopp/ -lcryptopp

INCLUDEPATH += $$PWD/cryptopp
DEPENDPATH += $$PWD/cryptopp

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/cryptopp/release/libcryptopp.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/cryptopp/debug/libcryptopp.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/cryptopp/release/cryptopp.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/cryptopp/debug/cryptopp.lib
else:unix: PRE_TARGETDEPS += $$PWD/cryptopp/libcryptopp.a

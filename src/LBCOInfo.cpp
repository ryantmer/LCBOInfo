#include "LCBOInfo.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/Page>
#include <bb/cascades/Container>
#include <bb/data/JsonDataAccess>
#include <bb/system/SystemToast>
#include <bb/system/SystemUiPosition>
#include <bb/PackageInfo>

using namespace bb::cascades;
using namespace bb::data;
using namespace bb::system;

QString favouritesPath = QDir::currentPath() + "/data/favourites.json";
QString baseUrl = QString("https://lcboapi.com/");
QString credentials = QString("Token MDo4Nzk2N2M4Mi1iMzAzLTExZTQtYWMzMi02YjZjN2E2OWU5NTY6cnphd2NKQktCdDVEWDVET2VVMFB6UkJyS2l2UjhXYXp0emN0");

LCBOInfo::LCBOInfo() : QObject() {
    _netConfigMan = new QNetworkConfigurationManager(this);
    _netAccessMan = new QNetworkAccessManager(this);
    _results = new ResultsDataModel();

    QmlDocument *qml = QmlDocument::create("asset:///LCBOInfo.qml").parent(this);
    qml->setContextProperty("app", this);
    _root = qml->createRootObject<NavigationPane>();
    Application::instance()->setScene(_root);

    QDeclarativeEngine *engine = QmlDocument::defaultDeclarativeEngine();
    QDeclarativeContext *rootContext = engine->rootContext();
    rootContext->setContextProperty("app", this);
    rootContext->setContextProperty("resultsModel", _results);

    bool ok;
    ok = connect(_netAccessMan, SIGNAL(finished(QNetworkReply*)),
            this, SLOT(onFinished(QNetworkReply*)));
    Q_ASSERT(ok);
    Q_UNUSED(ok);
}

LCBOInfo::~LCBOInfo() {}

QString LCBOInfo::getVersionNumber() {
    bb::PackageInfo pi;
    return pi.version();
}

void LCBOInfo::toast(QString message, SystemUiPosition::Type pos) {
    SystemToast *toast = new SystemToast(this);
    toast->setBody(message);
    toast->setPosition(pos);
    toast->show();
}

void LCBOInfo::query(QVariantMap query) {
    qDebug() << Q_FUNC_INFO << "Searching for" << query;

    //Make activity indicator visible
    Page *page = _root->top();
    Container *container = page->findChild<Container*>("activityContainer");
    if (container) {
        container->setVisible(true);
    } else {
        qDebug() << Q_FUNC_INFO << "No activity container on top page";
    }

    QUrl url;
    url.setUrl(baseUrl + "stores");

    QVariantMap::iterator iter;
    for (iter = query.begin(); iter != query.end(); ++iter) {
        QString k = iter.key();
        QString v = query.value(iter.key()).toString();
        url.addQueryItem(k, v);
    }

    qDebug() << Q_FUNC_INFO << url;

    QNetworkRequest req(url);
    req.setRawHeader("Authorization", credentials.toAscii());
    req.setAttribute(QNetworkRequest::User, QVariant(Store));

    _netAccessMan->get(req);
}

void LCBOInfo::onFinished(QNetworkReply *reply) {
    QString response = reply->readAll();
    qDebug() << Q_FUNC_INFO << response;

    _results->clear();

    if (reply->error() == QNetworkReply::NoError) {
        JsonDataAccess jda;
        QVariantMap map = jda.loadFromBuffer(response).value<QVariantMap>();
        if (jda.hasError()) {
            qWarning() << Q_FUNC_INFO << "Couldn't read response into JSON:" << jda.error();
            qWarning() << Q_FUNC_INFO << response;
            return;
        }

        QVariantList results = map.value("result").toList();
        foreach (QVariant a, results) {
            QVariantMap result = a.toMap();
            qDebug() << Q_FUNC_INFO << "Adding result" << result;
            _results->addResult(result);
        }
    }

    //Set activity indicator to be invisible
    Page *page = _root->top();
    Container *container = page->findChild<Container*>("activityContainer");
    if (container) {
        container->setVisible(false);
    } else {
        qDebug() << Q_FUNC_INFO << "No activity container on top page";
    }
}

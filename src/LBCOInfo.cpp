#include "LCBOInfo.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/Page>
#include <bb/cascades/Container>
#include <bb/cascades/Label>
#include <bb/data/JsonDataAccess>
#include <bb/system/SystemToast>
#include <bb/system/SystemUiPosition>
#include <bb/system/phone/Phone>
#include <bb/PackageInfo>

using namespace bb::cascades;
using namespace bb::data;
using namespace bb::system;

QString favouritesPath = QDir::currentPath() + "/data/favourites.json";
QString baseUrl = QString("https://lcboapi.com/");
QString credentials = QString("Token MDo4Nzk2N2M4Mi1iMzAzLTExZTQtYWMzMi02YjZjN2E2OWU5NTY6cnphd2NKQktCdDVEWDVET2VVMFB6UkJyS2l2UjhXYXp0emN0");

LCBOInfo::LCBOInfo()
:   QObject(),
    _netAccessMan(new QNetworkAccessManager(this)),
    _results(new ResultsDataModel())
{
    qmlRegisterType<phone::Phone>("bb.system.phone", 1, 0, "Phone");

    bool ok;
    ok = connect(_netAccessMan, SIGNAL(finished(QNetworkReply*)),
            this, SLOT(onFinished(QNetworkReply*)));
    Q_ASSERT(ok);
    ok = connect(this, SIGNAL(startActivity(QString)),
            this, SLOT(onStartActivity(QString)));
    Q_ASSERT(ok);
    ok = connect(this, SIGNAL(endActivity()),
            this, SLOT(onEndActivity()));
    Q_ASSERT(ok);
    Q_UNUSED(ok);

    QmlDocument *qml = QmlDocument::create("asset:///LCBOInfo.qml").parent(this);
    qml->setContextProperty("app", this);
    _root = qml->createRootObject<NavigationPane>();
    Application::instance()->setScene(_root);

    qml = QmlDocument::create("asset:///ActivityDialog.qml").parent(this);
    _activityDialog = qml->createRootObject<Dialog>();

    QDeclarativeEngine *engine = QmlDocument::defaultDeclarativeEngine();
    QDeclarativeContext *rootContext = engine->rootContext();
    rootContext->setContextProperty("app", this);
    rootContext->setContextProperty("resultsModel", _results);
}

LCBOInfo::~LCBOInfo() {
    delete _results;
}

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

void LCBOInfo::onStartActivity(QString message) {
    Label *activityText = _activityDialog->findChild<Label*>("activityText");
    activityText->setText(message);
    _activityDialog->open();
}

void LCBOInfo::onEndActivity() {
    _activityDialog->close();
}

/*
 * Location
 */
void LCBOInfo::nearbyStores() {
    emit startActivity(QString("Getting location..."));
    QGeoPositionInfoSource *src = QGeoPositionInfoSource::createDefaultSource(this);
    src->setPreferredPositioningMethods(QGeoPositionInfoSource::AllPositioningMethods);

    bool ok = connect(src, SIGNAL(positionUpdated(const QGeoPositionInfo&)),
            this, SLOT(onPositionUpdated(const QGeoPositionInfo&)));
    if (ok) {
        src->requestUpdate();
    } else {
        qDebug() << Q_FUNC_INFO << "Couldn't get location!";
    }
}

void LCBOInfo::onPositionUpdated(const QGeoPositionInfo &pos) {
    double lat = pos.coordinate().latitude();
    double lon = pos.coordinate().longitude();
    qDebug() << Q_FUNC_INFO << "Got location:" << lat << lon;

    QVariantMap q;
    q.insert("lat", lat);
    q.insert("lon", lon);
    q.insert("order", "distance_in_meters");

    query("stores", q);
}
/*
 * End Location
 */

/*
 * Search Query
 */
void LCBOInfo::query(QString endPoint, QVariantMap query) {
    emit startActivity(QString("Searching..."));

    qDebug() << Q_FUNC_INFO << "Searching for" << query;

    QUrl url;
    url.setUrl(baseUrl + endPoint);

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
            if (!result.value("is_dead").toBool()) {
                //is_dead indicates store has closed, don't display
                _results->addResult(result);
            }
        }
    }

    emit endActivity();
}
/*
 * End Search Query
 */

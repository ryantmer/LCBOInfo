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
#include <bb/system/SystemUiPosition>
#include <bb/PackageInfo>

using namespace bb::cascades;
using namespace bb::data;
using namespace bb::system;

QString favouritesPath = QDir::currentPath() + "/data/favourites.json";
QString baseUrl = QString("https://lcboapi.com/");
QString credentials = QString("Token MDo4Nzk2N2M4Mi1iMzAzLTExZTQtYWMzMi02YjZjN2E2OWU5NTY6cnphd2NKQktCdDVEWDVET2VVMFB6UkJyS2l2UjhXYXp0emN0");

QString myStorePath = QDir::currentPath() + "/data/myStore.json";

LCBOInfo::LCBOInfo()
:   QObject(),
    _netAccessMan(new QNetworkAccessManager(this)),
    _storeResults(new ResultsModel()),
    _productResults(new ResultsModel()),
    _inventoryCount(-1)
{
    qmlRegisterType<phone::Phone>("bb.system.phone", 1, 0, "Phone");

    //Loading the user's store
    QSettings settings("ryantmer", "LCBOInfo");
    _myStoreId = settings.value("store", 0).toInt(NULL);
    qDebug() << Q_FUNC_INFO << "Favourite store ID:" << _myStoreId;

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
    ok = connect(this, SIGNAL(myStoreIdChanged(int)),
            this, SLOT(onMyStoreIdChanged(int)));
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
    rootContext->setContextProperty("productsModel", _productResults);
    rootContext->setContextProperty("storesModel", _storeResults);
}
LCBOInfo::~LCBOInfo() {
    delete _productResults;
    delete _storeResults;
}

QString LCBOInfo::getVersionNumber() {
    bb::PackageInfo pi;
    return pi.version();
}

void LCBOInfo::setMyStoreId(int storeId) {
    _myStoreId = storeId;
    QSettings settings("ryantmer", "LCBOInfo");
    settings.setValue("store", _myStoreId);
    emit myStoreIdChanged(storeId);
}

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

/*
 * Querying functions
 */
void LCBOInfo::queryStores(QVariantMap query) {
    emit startActivity();
    QUrl url(baseUrl + "stores");
    QVariantMap::iterator iter;
    for (iter = query.begin(); iter != query.end(); ++iter) {
        QString k = iter.key();
        QString v = query.value(iter.key()).toString();
        url.addQueryItem(k, v);
    }
    QNetworkRequest req(url);
    req.setRawHeader("Authorization", credentials.toAscii());
    qDebug() << Q_FUNC_INFO << url;
    _netAccessMan->get(req);
}

void LCBOInfo::queryStore(int storeId) {
    emit startActivity();
    QUrl url(baseUrl + "stores/" + QString::number(storeId));
    QNetworkRequest req(url);
    req.setRawHeader("Authorization", credentials.toAscii());
    qDebug() << Q_FUNC_INFO << url;
    _netAccessMan->get(req);
}

void LCBOInfo::queryProducts(QVariantMap query) {
    emit startActivity();
    QUrl url(baseUrl + "products");
    QVariantMap::iterator iter;
    for (iter = query.begin(); iter != query.end(); ++iter) {
        QString k = iter.key();
        QString v = query.value(iter.key()).toString();
        url.addQueryItem(k, v);
    }
    QNetworkRequest req(url);
    req.setRawHeader("Authorization", credentials.toAscii());
    qDebug() << Q_FUNC_INFO << url;
    _netAccessMan->get(req);
}

void LCBOInfo::queryProduct(int productId) {
    emit startActivity();
    QUrl url(baseUrl + "products/" + QString::number(productId));
    QNetworkRequest req(url);
    req.setRawHeader("Authorization", credentials.toAscii());
    qDebug() << Q_FUNC_INFO << url;
    _netAccessMan->get(req);
}

void LCBOInfo::queryProductAtStore(int productId, int storeId) {
    if (_myStoreId == 0) {
        qDebug() << Q_FUNC_INFO << "Store not set, can't get inventory of product ID" << productId;
        return;
    }
    QUrl url(baseUrl + "stores/" + QString::number(storeId) +
            "/products/" + QString::number(productId) + "/inventory");
    QNetworkRequest req(url);
    req.setRawHeader("Authorization", credentials.toAscii());
    qDebug() << Q_FUNC_INFO << url;
    _netAccessMan->get(req);
}

/*
 * QML Slots
 */
void LCBOInfo::onStartActivity(QString message) {
    Label *activityText = _activityDialog->findChild<Label*>("activityText");
    activityText->setText(message);
    _activityDialog->open();
}

void LCBOInfo::onEndActivity() {
    _activityDialog->close();
}

void LCBOInfo::onMyStoreIdChanged(int storeId) {
    qDebug() << Q_FUNC_INFO << "Favourite store ID changed to" << storeId;
    SystemToast *toast = new SystemToast(this);
    toast->setBody("Store saved");
    toast->setPosition(SystemUiPosition::BottomCenter);
    toast->show();
}

void LCBOInfo::onPositionUpdated(const QGeoPositionInfo &pos) {
    double lat = pos.coordinate().latitude();
    double lon = pos.coordinate().longitude();
    qDebug() << Q_FUNC_INFO << "Got location:" << lat << lon;

    QVariantMap q;
    q.insert("lat", lat);
    q.insert("lon", lon);
    q.insert("order", "distance_in_meters");

    queryStores(q);
}

void LCBOInfo::onFinished(QNetworkReply *reply) {
    QString response = reply->readAll();
    qDebug() << Q_FUNC_INFO << response;

    if (reply->error() == QNetworkReply::NoError) {
        JsonDataAccess jda;
        QVariantMap map = jda.loadFromBuffer(response).value<QVariantMap>();
        if (jda.hasError()) {
            qWarning() << Q_FUNC_INFO << "Couldn't read response into JSON:" << jda.error();
            qWarning() << Q_FUNC_INFO << response;
            return;
        }

        QString replyUrl = reply->url().toString(QUrl::RemoveQuery);
        if (replyUrl.contains("/inventory")) {
            QVariantMap results = map.value("result").toMap();
            _inventoryCount = results.value("quantity").toInt(NULL);
            emit inventoryCountChanged(_inventoryCount);
        } else if (replyUrl.contains("/stores")) {
            if (!reply->url().toString().contains("page")) {
                //If we're searching for an additional page, don't clear the model first
                _storeResults->clear();
            }
            QVariantList results = map.value("result").toList();
            foreach (QVariant a, results) {
                QVariantMap result = a.toMap();
                if (!result.value("is_dead").toBool()) {
                    //is_dead indicates a store has closed, don't display
                    _storeResults->append(result);
                }
            }
        } else if (replyUrl.contains("/products")) {
            if (!reply->url().toString().contains("page")) {
                _productResults->clear();
            }
            QVariantList results = map.value("result").toList();
            foreach (QVariant a, results) {
                QVariantMap result = a.toMap();
                if (!result.value("is_dead").toBool()) {
                    _productResults->append(result);
                }
            }
        }
    }

    emit endActivity();
}

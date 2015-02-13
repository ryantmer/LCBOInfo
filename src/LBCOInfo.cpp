#include "LCBOInfo.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/data/JsonDataAccess>

using namespace bb::cascades;
using namespace bb::data;

QString favouritesPath = QDir::currentPath() + "/data/favourites.json";

LCBOInfo::LCBOInfo() : QObject() {
    _netConfigMan = new QNetworkConfigurationManager(this);
    _netAccessMan = new QNetworkAccessManager(this);
    _favouriteProducts = new QMapListDataModel();
    _favouriteStores = new QMapListDataModel();

    //Load favourites from file, if possible
    QFile file(favouritesPath);
    qDebug() << Q_FUNC_INFO << "Reading favourites from" << file.fileName();
    JsonDataAccess jda(&file);
    QVariantList list = jda.load(&file).value<QVariantList>();
    if (jda.hasError()) {
        qWarning() << Q_FUNC_INFO << "Could not read favourites" << jda.error();
    }

    foreach (QVariant v, list) {
        QVariantMap data = v.toMap();
        if (data.value("type") == "store") {
            _favouriteStores->append(data);
        } else if (data.value("type") == "product") {
            _favouriteProducts->append(data);
        } else {
            qDebug() << Q_FUNC_INFO << "Unknown favourite type:" << data;
        }
    }
    qDebug() << Q_FUNC_INFO << "Favourite stores loaded:" << _favouriteStores;
    qDebug() << Q_FUNC_INFO << "Favourite products loaded:" << _favouriteStores;

    QmlDocument *qml = QmlDocument::create("asset:///LCBOInfo.qml").parent(this);
    qml->setContextProperty("app", this);
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    Application::instance()->setScene(root);

    QDeclarativeEngine *engine = QmlDocument::defaultDeclarativeEngine();
    QDeclarativeContext *rootContext = engine->rootContext();
    rootContext->setContextProperty("app", this);
    rootContext->setContextProperty("favouriteStoresModel", _favouriteStores);
    rootContext->setContextProperty("favouriteProductsModel", _favouriteProducts);
    rootContext->setContextProperty("resultsModel", _results);

    bool ok;
    ok = connect(_netAccessMan, SIGNAL(finished(QNetworkReply*)),
            this, SLOT(onFinished(QNetworkReply*)));
    Q_ASSERT(ok);
    Q_UNUSED(ok);
}

LCBOInfo::~LCBOInfo() {
    QFile file(favouritesPath);
    qDebug() << Q_FUNC_INFO << "Saving favourites to" << file.fileName();
    JsonDataAccess jda(&file);

    QVariantList list;
    for (int i = 0; i < _favouriteStores->size(); ++i) {
        list.append(_favouriteStores->value(i));
    }
    for (int i = 0; i < _favouriteProducts->size(); ++i) {
        list.append(_favouriteProducts->value(i));
    }
    jda.save(list, &file);

    if (jda.hasError()) {
        qDebug() << Q_FUNC_INFO << "Couldn't save favourites!";
        qDebug() << Q_FUNC_INFO << jda.error();
    } else {
        file.close();
    }
}

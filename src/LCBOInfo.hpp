#ifndef LCBOInfo_HPP_
#define LCBOInfo_HPP_

#include <QObject>
#include <QtLocationSubset/QGeoPositionInfo>
#include <QtLocationSubset/QGeoPositionInfoSource>
#include <bb/cascades/QListDataModel>
#include <bb/cascades/NavigationPane>
#include <bb/cascades/Dialog>
#include "ResultsDataModel.hpp"

using namespace bb::cascades;
using namespace QtMobilitySubset;

class LCBOInfo : public QObject {
    Q_OBJECT
public:
    enum RequestType {
        Undefined,
        Store,
        Product,
        Inventory
    };
    LCBOInfo();
    virtual ~LCBOInfo();

    Q_PROPERTY(int myStore READ myStoreId WRITE setMyStoreId NOTIFY myStoreIdChanged);
    Q_PROPERTY(int inventoryCount READ inventoryCount NOTIFY inventoryCountChanged);
    Q_INVOKABLE void queryStores(QVariantMap query);
    Q_INVOKABLE void queryStore(int storeId);
    Q_INVOKABLE void queryProducts(QVariantMap query);
    Q_INVOKABLE void queryProduct(int productId);
    Q_INVOKABLE void queryProductAtStore(int productId, int storeId);
    Q_INVOKABLE QString getVersionNumber();
    Q_INVOKABLE void nearbyStores();
    int myStoreId() { return _myStoreId; };
    void setMyStoreId(int storeId);
    int inventoryCount() { return _inventoryCount; };

private:
    QNetworkAccessManager *_netAccessMan;
    ResultsDataModel *_results;
    int _myStoreId;
    int _inventoryCount;
    NavigationPane *_root;
    Dialog *_activityDialog;

signals:
    void startActivity(QString message="Loading...");
    void endActivity();
    void myStoreIdChanged(int storeId);
    void inventoryCountChanged(int count);

private slots:
    void onStartActivity(QString message="Loading...");
    void onEndActivity();
    void onMyStoreIdChanged(int storeId);
    void onFinished(QNetworkReply *reply);
    void onPositionUpdated(const QGeoPositionInfo &pos);
};

#endif /* ApplicationUI_HPP_ */

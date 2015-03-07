#ifndef LCBOInfo_HPP_
#define LCBOInfo_HPP_

#include <QObject>
#include <QtLocationSubset/QGeoPositionInfo>
#include <QtLocationSubset/QGeoPositionInfoSource>
#include <bb/cascades/QListDataModel>
#include <bb/cascades/NavigationPane>
#include <bb/cascades/Dialog>
#include <bb/system/SystemUiPosition>
#include "ResultsDataModel.hpp"

using namespace bb::cascades;
using namespace bb::system;
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

    Q_INVOKABLE void query(QString endPoint, QVariantMap query);
    Q_INVOKABLE QString getVersionNumber();
    Q_INVOKABLE void nearbyStores();
    void toast(QString message, SystemUiPosition::Type pos=SystemUiPosition::BottomCenter);

private:
    QNetworkAccessManager *_netAccessMan;
    ResultsDataModel *_results;
    NavigationPane *_root;
    Dialog *_activityDialog;

signals:
    void startActivity(QString message);
    void endActivity();

private slots:
    void onStartActivity(QString message = "Please wait...");
    void onEndActivity();
    void onFinished(QNetworkReply *reply);
    void onPositionUpdated(const QGeoPositionInfo &pos);
};

#endif /* ApplicationUI_HPP_ */

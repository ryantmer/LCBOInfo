#ifndef LCBOInfo_HPP_
#define LCBOInfo_HPP_

#include <QObject>
#include <bb/cascades/QListDataModel>
#include <bb/cascades/NavigationPane>
#include <bb/system/SystemUiPosition>
#include "ResultsDataModel.hpp"

using namespace bb::cascades;
using namespace bb::system;

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

    Q_INVOKABLE void query(QVariantMap query);
    Q_INVOKABLE QString getVersionNumber();
    void toast(QString message, SystemUiPosition::Type pos=SystemUiPosition::BottomCenter);

private:
    ResultsDataModel *_results;
    bb::cascades::NavigationPane *_root;
    QNetworkConfigurationManager *_netConfigMan;
    QNetworkAccessManager *_netAccessMan;

private slots:
    void onFinished(QNetworkReply *reply);
};

#endif /* ApplicationUI_HPP_ */

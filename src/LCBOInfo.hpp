#ifndef LCBOInfo_HPP_
#define LCBOInfo_HPP_

#include <QObject>
#include <bb/cascades/QListDataModel>
#include <bb/cascades/NavigationPane>
#include "ResultsDataModel.hpp"

class LCBOInfo : public QObject {
    Q_OBJECT
public:
    LCBOInfo();
    virtual ~LCBOInfo();

//    Q_INVOKABLE void search(QVariantMap query);
//    Q_INVOKABLE void addFavourite(QVariantMap fav);
//    Q_INVOKABLE void removeFavourite(QVariantMap fav);
//    Q_INVOKABLE QString getVersionNumber();
//    void toast(QString message);

private:
    ResultsDataModel *_results;
    bb::cascades::QMapListDataModel *_favouriteStores;
    bb::cascades::QMapListDataModel *_favouriteProducts;
    bb::cascades::NavigationPane *_root;
    QNetworkConfigurationManager *_netConfigMan;
    QNetworkAccessManager *_netAccessMan;

private slots:
//    void onFinished(QNetworkReply *reply);
};

#endif /* ApplicationUI_HPP_ */

#include "ResultsDataModel.hpp"

using namespace bb::cascades;

ResultsDataModel::ResultsDataModel(QObject *parent) : DataModel(parent) {

}

void ResultsDataModel::clear() {
    _internalDB.clear();
    emit itemsChanged(DataModelChangeType::AddRemove);
}

QVariantList ResultsDataModel::getInternalDB() {
    return _internalDB;
}

int ResultsDataModel::childCount(const QVariantList &indexPath) {
    int retVal = 0;
    if (indexPath.length() == 0) {
        retVal = _internalDB.length();
    } else {
        //Nothing aside from root has children; no hierarchy in datamodel
        retVal = 0;
    }
    return retVal;
}

bool ResultsDataModel::hasChildren(const QVariantList &indexPath) {
    return childCount(indexPath) > 0;
}

QVariant ResultsDataModel::data(const QVariantList &indexPath) {
    //Model is just a list of maps, so return map at given indexPath
    //(will be either a store or product)
    return QVariant(_internalDB.value(indexPath.value(0).toInt(NULL)).toMap());
}

QString ResultsDataModel::itemType(const QVariantList &indexPath) {
    QString retVal;
    QVariantMap d = data(indexPath).toMap();
    if (d.value("type").toString() == "store") {
        retVal =  "store";
    } else if (d.value("type").toString() == "product") {
        retVal = "product";
    } else {
        qDebug() << Q_FUNC_INFO << "Unknown type";
        qDebug() << Q_FUNC_INFO << d << indexPath;
    }
    return retVal;
}

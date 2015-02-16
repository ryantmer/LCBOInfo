#ifndef RESULTSDATAMODEL_HPP_
#define RESULTSDATAMODEL_HPP_

#include <bb/cascades/DataModel>

class ResultsDataModel : public bb::cascades::DataModel {
    Q_OBJECT
    Q_PROPERTY(bool empty READ isEmpty NOTIFY emptyChanged);

public:
    ResultsDataModel(QObject *parent = 0);

    void clear();
    void addResult(QVariantMap result);
    QVariantList getInternalDB();
    bool isEmpty();

    virtual int childCount(const QVariantList &indexPath);
    virtual bool hasChildren(const QVariantList &indexPath);
    virtual QVariant data(const QVariantList &indexPath);
    virtual QString itemType(const QVariantList &indexPath);

private:
    QVariantList _internalDB;

signals:
    void emptyChanged(bool empty);
};

#endif /* RESULTSDATAMODEL_HPP_ */

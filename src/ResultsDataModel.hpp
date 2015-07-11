#ifndef RESULTSDATAMODEL_HPP_
#define RESULTSDATAMODEL_HPP_

#include <bb/cascades/QListDataModel>

typedef bb::cascades::QListDataModel<QVariant> ResultsListModel;

class ResultsModel : public ResultsListModel {
    Q_OBJECT
    Q_PROPERTY(bool empty READ isEmpty NOTIFY emptyChanged);

public:
    ResultsModel(QObject *parent = 0);
    QString itemType(const QVariantList &indexPath);
    bool isEmpty();
    void append(QVariant data);
    void clear();

signals:
    void emptyChanged(bool empty);
};

#endif /* RESULTSDATAMODEL_HPP_ */

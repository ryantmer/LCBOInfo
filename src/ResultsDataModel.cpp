#include "ResultsDataModel.hpp"

using namespace bb::cascades;

ResultsModel::ResultsModel(QObject *parent) {
    Q_UNUSED(parent);
}

void ResultsModel::clear() {
    QListDataModel::clear();
    emit emptyChanged(isEmpty());
    return;
}

void ResultsModel::append(QVariant data) {
    QListDataModel::append(data);
    emit emptyChanged(isEmpty());
    return;
}

bool ResultsModel::isEmpty() {
    return size() == 0;
}

QString ResultsModel::itemType(const QVariantList &indexPath) {
    Q_UNUSED(indexPath);
    return "item";
}

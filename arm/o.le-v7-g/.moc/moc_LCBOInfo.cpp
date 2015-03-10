/****************************************************************************
** Meta object code from reading C++ file 'LCBOInfo.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.5)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/LCBOInfo.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'LCBOInfo.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.5. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_LCBOInfo[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      17,   14, // methods
       2,   99, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: signature, parameters, type, tag, flags
      18,   10,    9,    9, 0x05,
      41,    9,    9,    9, 0x05,
      63,   55,    9,    9, 0x05,
      91,   85,    9,    9, 0x05,

 // slots: signature, parameters, type, tag, flags
     118,   10,    9,    9, 0x08,
     143,    9,    9,    9, 0x28,
     161,    9,    9,    9, 0x08,
     177,   55,    9,    9, 0x08,
     207,  201,    9,    9, 0x08,
     238,  234,    9,    9, 0x08,

 // methods: signature, parameters, type, tag, flags
     280,  274,    9,    9, 0x02,
     305,   55,    9,    9, 0x02,
     321,  274,    9,    9, 0x02,
     358,  348,    9,    9, 0x02,
     394,  376,    9,    9, 0x02,
     431,    9,  423,    9, 0x02,
     450,    9,    9,    9, 0x02,

 // properties: name, type, flags
     469,  465, 0x02495003,
     477,  465, 0x02495001,

 // properties: notify_signal_id
       2,
       3,

       0        // eod
};

static const char qt_meta_stringdata_LCBOInfo[] = {
    "LCBOInfo\0\0message\0startActivity(QString)\0"
    "endActivity()\0storeId\0myStoreIdChanged(int)\0"
    "count\0inventoryCountChanged(int)\0"
    "onStartActivity(QString)\0onStartActivity()\0"
    "onEndActivity()\0onMyStoreIdChanged(int)\0"
    "reply\0onFinished(QNetworkReply*)\0pos\0"
    "onPositionUpdated(QGeoPositionInfo)\0"
    "query\0queryStores(QVariantMap)\0"
    "queryStore(int)\0queryProducts(QVariantMap)\0"
    "productId\0queryProduct(int)\0"
    "productId,storeId\0queryProductAtStore(int,int)\0"
    "QString\0getVersionNumber()\0nearbyStores()\0"
    "int\0myStore\0inventoryCount\0"
};

void LCBOInfo::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        LCBOInfo *_t = static_cast<LCBOInfo *>(_o);
        switch (_id) {
        case 0: _t->startActivity((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->endActivity(); break;
        case 2: _t->myStoreIdChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: _t->inventoryCountChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 4: _t->onStartActivity((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 5: _t->onStartActivity(); break;
        case 6: _t->onEndActivity(); break;
        case 7: _t->onMyStoreIdChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 8: _t->onFinished((*reinterpret_cast< QNetworkReply*(*)>(_a[1]))); break;
        case 9: _t->onPositionUpdated((*reinterpret_cast< const QGeoPositionInfo(*)>(_a[1]))); break;
        case 10: _t->queryStores((*reinterpret_cast< QVariantMap(*)>(_a[1]))); break;
        case 11: _t->queryStore((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 12: _t->queryProducts((*reinterpret_cast< QVariantMap(*)>(_a[1]))); break;
        case 13: _t->queryProduct((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 14: _t->queryProductAtStore((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 15: { QString _r = _t->getVersionNumber();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 16: _t->nearbyStores(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData LCBOInfo::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject LCBOInfo::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_LCBOInfo,
      qt_meta_data_LCBOInfo, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &LCBOInfo::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *LCBOInfo::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *LCBOInfo::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_LCBOInfo))
        return static_cast<void*>(const_cast< LCBOInfo*>(this));
    return QObject::qt_metacast(_clname);
}

int LCBOInfo::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 17)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 17;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = myStoreId(); break;
        case 1: *reinterpret_cast< int*>(_v) = inventoryCount(); break;
        }
        _id -= 2;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setMyStoreId(*reinterpret_cast< int*>(_v)); break;
        }
        _id -= 2;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void LCBOInfo::startActivity(QString _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void LCBOInfo::endActivity()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void LCBOInfo::myStoreIdChanged(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void LCBOInfo::inventoryCountChanged(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}
QT_END_MOC_NAMESPACE

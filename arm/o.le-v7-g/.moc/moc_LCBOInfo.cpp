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
      10,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      18,   10,    9,    9, 0x05,
      41,    9,    9,    9, 0x05,

 // slots: signature, parameters, type, tag, flags
      55,   10,    9,    9, 0x08,
      80,    9,    9,    9, 0x28,
      98,    9,    9,    9, 0x08,
     120,  114,    9,    9, 0x08,
     151,  147,    9,    9, 0x08,

 // methods: signature, parameters, type, tag, flags
     202,  187,    9,    9, 0x02,
     237,    9,  229,    9, 0x02,
     256,    9,    9,    9, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_LCBOInfo[] = {
    "LCBOInfo\0\0message\0startActivity(QString)\0"
    "endActivity()\0onStartActivity(QString)\0"
    "onStartActivity()\0onEndActivity()\0"
    "reply\0onFinished(QNetworkReply*)\0pos\0"
    "onPositionUpdated(QGeoPositionInfo)\0"
    "endPoint,query\0query(QString,QVariantMap)\0"
    "QString\0getVersionNumber()\0nearbyStores()\0"
};

void LCBOInfo::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        LCBOInfo *_t = static_cast<LCBOInfo *>(_o);
        switch (_id) {
        case 0: _t->startActivity((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->endActivity(); break;
        case 2: _t->onStartActivity((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->onStartActivity(); break;
        case 4: _t->onEndActivity(); break;
        case 5: _t->onFinished((*reinterpret_cast< QNetworkReply*(*)>(_a[1]))); break;
        case 6: _t->onPositionUpdated((*reinterpret_cast< const QGeoPositionInfo(*)>(_a[1]))); break;
        case 7: _t->query((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QVariantMap(*)>(_a[2]))); break;
        case 8: { QString _r = _t->getVersionNumber();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 9: _t->nearbyStores(); break;
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
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    }
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
QT_END_MOC_NAMESPACE

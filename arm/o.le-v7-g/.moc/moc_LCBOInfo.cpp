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
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      16,   10,    9,    9, 0x08,

 // methods: signature, parameters, type, tag, flags
      49,   43,    9,    9, 0x02,
      76,    9,   68,    9, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_LCBOInfo[] = {
    "LCBOInfo\0\0reply\0onFinished(QNetworkReply*)\0"
    "query\0query(QVariantMap)\0QString\0"
    "getVersionNumber()\0"
};

void LCBOInfo::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        LCBOInfo *_t = static_cast<LCBOInfo *>(_o);
        switch (_id) {
        case 0: _t->onFinished((*reinterpret_cast< QNetworkReply*(*)>(_a[1]))); break;
        case 1: _t->query((*reinterpret_cast< QVariantMap(*)>(_a[1]))); break;
        case 2: { QString _r = _t->getVersionNumber();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
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
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    }
    return _id;
}
QT_END_MOC_NAMESPACE

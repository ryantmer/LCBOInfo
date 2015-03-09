# Config.pri file version 2.0. Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR = $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        } else {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }

    }

    CONFIG(release, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

simulator {
    CONFIG(debug, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

config_pri_assets {
    OTHER_FILES += \
        $$quote($$BASEDIR/assets/ActivityDialog.qml) \
        $$quote($$BASEDIR/assets/CustomButton.qml) \
        $$quote($$BASEDIR/assets/LCBOInfo.qml) \
        $$quote($$BASEDIR/assets/ProductCategory.qml) \
        $$quote($$BASEDIR/assets/ProductDetails.qml) \
        $$quote($$BASEDIR/assets/ProductFavourites.qml) \
        $$quote($$BASEDIR/assets/ProductSearch.qml) \
        $$quote($$BASEDIR/assets/ProductSearchResults.qml) \
        $$quote($$BASEDIR/assets/StoreDetails.qml) \
        $$quote($$BASEDIR/assets/StoreFavourites.qml) \
        $$quote($$BASEDIR/assets/StoreSearch.qml) \
        $$quote($$BASEDIR/assets/StoreSearchResults.qml) \
        $$quote($$BASEDIR/assets/images/kosher.png) \
        $$quote($$BASEDIR/assets/images/no.png) \
        $$quote($$BASEDIR/assets/images/ocb.png) \
        $$quote($$BASEDIR/assets/images/vqa.png) \
        $$quote($$BASEDIR/assets/images/yes.png)
}

config_pri_source_group1 {
    SOURCES += \
        $$quote($$BASEDIR/src/LBCOInfo.cpp) \
        $$quote($$BASEDIR/src/ResultsDataModel.cpp) \
        $$quote($$BASEDIR/src/main.cpp)

    HEADERS += \
        $$quote($$BASEDIR/src/LCBOInfo.hpp) \
        $$quote($$BASEDIR/src/ResultsDataModel.hpp)
}

CONFIG += precompile_header

PRECOMPILED_HEADER = $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES += \
        $$quote($$BASEDIR/../src/*.c) \
        $$quote($$BASEDIR/../src/*.c++) \
        $$quote($$BASEDIR/../src/*.cc) \
        $$quote($$BASEDIR/../src/*.cpp) \
        $$quote($$BASEDIR/../src/*.cxx) \
        $$quote($$BASEDIR/../assets/*.qml) \
        $$quote($$BASEDIR/../assets/*.js) \
        $$quote($$BASEDIR/../assets/*.qs) \
        $$quote($$BASEDIR/../assets/images/*.qml) \
        $$quote($$BASEDIR/../assets/images/*.js) \
        $$quote($$BASEDIR/../assets/images/*.qs)

    HEADERS += \
        $$quote($$BASEDIR/../src/*.h) \
        $$quote($$BASEDIR/../src/*.h++) \
        $$quote($$BASEDIR/../src/*.hh) \
        $$quote($$BASEDIR/../src/*.hpp) \
        $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS = $$quote($${TARGET}.ts)

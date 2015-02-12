#include "LCBOInfo.hpp"
#include <bb/cascades/Application>
#include <Qt/qdeclarativedebug.h>

using namespace bb::cascades;

void messageOutput(QtMsgType type, const char *msg)
{
    switch (type) {
    case QtDebugMsg:
        fprintf(stderr, "DEBUG: %s\n", msg);
        break;
    case QtWarningMsg:
        fprintf(stderr, "WARNING: %s\n", msg);
        break;
    case QtCriticalMsg:
        fprintf(stderr, "CRITICAL: %s\n", msg);
        break;
    case QtFatalMsg:
        fprintf(stderr, "FATAL: %s\n", msg);
        abort();
    }
}

Q_DECL_EXPORT int main(int argc, char **argv)
{
    Application app(argc, argv);
    LCBOInfo appui;
    return Application::exec();
}

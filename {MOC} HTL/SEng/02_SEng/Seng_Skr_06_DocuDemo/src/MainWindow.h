#include "QMainWindow.h"
#include "CTriangle.h"

/**
 * @brief Window which will come up while starting the App.
 */
class MainWindow:QMainWindow {
protected:
    CTriangle list[10];
};
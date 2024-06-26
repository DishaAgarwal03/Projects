from PySide6.QtCore import (QCoreApplication, QMetaObject, QSize, Qt, Slot)
from PySide6.QtWidgets import (QHBoxLayout, QMainWindow, QSizePolicy,
                               QTabWidget, QWidget)

from HardwareMonitor import Monitor
from .cpu import cpu_tab
from .disk import disk_tab
from .gpu import gpu_tab
from .history import history_tab
from .ram import ram_tab
from .system import system_tab

class Ui_main_window(object):
    def setupUi(self, main_window):
        if not main_window.objectName():
            main_window.setObjectName(u"main_window")
        main_window.resize(960, 540)
        
        sizePolicy = QSizePolicy(QSizePolicy.Policy.Preferred, QSizePolicy.Policy.Preferred)
        sizePolicy.setHorizontalStretch(0)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(main_window.sizePolicy().hasHeightForWidth())
        
        main_window.setSizePolicy(sizePolicy)
        main_window.setMinimumSize(QSize(960, 540))
        main_window.setSizeIncrement(QSize(16, 9))
        main_window.setBaseSize(QSize(960, 540))
        main_window.setTabletTracking(True)
        main_window.setFocusPolicy(Qt.FocusPolicy.NoFocus)
        main_window.setContextMenuPolicy(Qt.ContextMenuPolicy.DefaultContextMenu)
        
        self.central_widget = QWidget(main_window)
        self.central_widget.setObjectName(u"central_widget")
        
        self.horizontalLayout = QHBoxLayout(self.central_widget)
        self.horizontalLayout.setObjectName(u"horizontalLayout")
        
        self.tab_container = QTabWidget(self.central_widget)
        self.tab_container.setObjectName(u"tab_container")
        self.tab_container.setLayoutDirection(Qt.LayoutDirection.LeftToRight)
        self.tab_container.setTabPosition(QTabWidget.TabPosition.West)
        self.tab_container.setTabShape(QTabWidget.TabShape.Rounded)
        self.tab_container.setElideMode(Qt.TextElideMode.ElideNone)
        
        self.system_tab = system_tab()
        self.system_tab.setObjectName(u"system_tab")
        self.tab_container.addTab(self.system_tab, "")
        
        self.processor_tab = cpu_tab()
        self.processor_tab.setObjectName(u"processor_tab")
        self.tab_container.addTab(self.processor_tab, "")
        
        self.memory_tab = ram_tab()
        self.memory_tab.setObjectName(u"memory_tab")
        self.tab_container.addTab(self.memory_tab, "")
        
        self.disk_tab = disk_tab()
        self.disk_tab.setObjectName(u"disk_tab")
        self.tab_container.addTab(self.disk_tab, "")
        
        self.gpu_tab = gpu_tab()
        self.gpu_tab.setObjectName(u"gpu_tab")
        self.tab_container.addTab(self.gpu_tab, "")
        
        self.history_tab = history_tab()
        self.history_tab.setObjectName(u"history_tab")
        self.tab_container.addTab(self.history_tab, "")

        self.horizontalLayout.addWidget(self.tab_container)

        main_window.setCentralWidget(self.central_widget)

        self.retranslateUi(main_window)

        self.tab_container.setCurrentIndex(0)

        QMetaObject.connectSlotsByName(main_window)
    # setupUi

    def retranslateUi(self, main_window):
        main_window.setWindowTitle(QCoreApplication.translate("main_window", u"pynit", None))
        self.tab_container.setTabText(self.tab_container.indexOf(self.system_tab),
                                      QCoreApplication.translate("main_window", u"System", None))
        self.tab_container.setTabText(self.tab_container.indexOf(self.processor_tab),
                                      QCoreApplication.translate("main_window", u"CPU", None))
        self.tab_container.setTabText(self.tab_container.indexOf(self.memory_tab),
                                      QCoreApplication.translate("main_window", u"RAM", None))
        self.tab_container.setTabText(self.tab_container.indexOf(self.disk_tab),
                                      QCoreApplication.translate("main_window", u"Disk", None))
        self.tab_container.setTabText(self.tab_container.indexOf(self.gpu_tab),
                                      QCoreApplication.translate("main_window", u"GPU", None))
        self.tab_container.setTabText(self.tab_container.indexOf(self.history_tab),
                                      QCoreApplication.translate("main_window", u"History", None))
    # retranslateUi


class main_window(QMainWindow, Ui_main_window):
    def __init__(self):
        super(main_window, self).__init__()
        self.setupUi(self)
        self.tab_container.tabBar().setDocumentMode(True)
        self.setWindowState(Qt.WindowState.WindowActive)
        self._components = {self.system_tab, self.processor_tab, self.memory_tab, self.disk_tab, self.history_tab}
        self._monitor = Monitor()
        if self._monitor.data.gpu is None:
            self.tab_container.removeTab(4)
        else:
            self._components.add(self.gpu_tab)
        self._monitor.worker.callback = self.draw

    @Slot()
    def draw(self):
        for x in self._components:
            update_ = getattr(x, "draw", None)
            if callable(update_):
                update_()

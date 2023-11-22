import os
from PySide6 import QtGui
from qt_material import apply_stylesheet

def load_theme(app):
    try:
        font_db = QtGui.QFontDatabase()
        font_db.addApplicationFont("GUI/ui/resources/jetbrains_mono.ttf")
        apply_stylesheet(app, theme="dark_amber.xml", extra={'font_family': 'JetBrains Mono'})
        stylesheet = app.styleSheet()
        absolute_path = os.path.dirname(__file__)
        with open(os.path.join(absolute_path, "ui/themes/style.css")) as file:
            app.setStyleSheet(stylesheet + file.read())
    except:
        raise Exception("Couldn't load theme.")

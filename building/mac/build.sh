export PKG_CONFIG_PATH=/usr/local/opt/qt@5.5/lib/pkgconfig
export PATH=/usr/local/opt/qt@5.5/bin:$PATH
export QT_CFLAGS="-I/usr/local/opt/qt@5.5/lib/QtDBus.framework/Versions/5/Headers -I/usr/local/opt/qt@5.5/lib/QtWidgets.framework/Versions/5/Headers -I/usr/local/opt/qt@5.5/lib/QtNetwork.framework/Versions/5/Headers -I/usr/local/opt/qt@5.5/lib/QtGui.framework/Versions/5/Headers -I/usr/local/opt/qt@5.5/lib/QtCore.framework/Versions/5/Headers -I. -I/usr/local/opt/qt@5.5/mkspecs/macx-clang -F/usr/local/opt/qt@5.5/lib"
export QT_LIBS="-F/usr/local/opt/qt@5.5/lib -framework QtWidgets -framework QtGui -framework QtCore -framework DiskArbitration -framework IOKit -framework OpenGL -framework AGL -framework QtNetwork -framework QtDBus"

./autogen.sh
echo QT_LIBS="\"$(echo $QT_LIBS)\"" QT_CFLAGS="\"$(echo $QT_CFLAGS)\""
./configure --with-gui=qt5 QT_LIBS="${QT_LIBS}" QT_CFLAGS="${QT_CFLAGS}"
make

echo Building daemon and qt...

cd $COINFOLDER

./autogen.sh
if [ ${?} -ne 0 ]; then echo "daemon autogen failed."; read -n 1 -s; exit 1;fi

LIBSH=$EWBPATHMSYS/$LIB

CPPFLAGS="-I$LIBSH/$OPENSSL/include \
-I$LIBSH/$BERKELEYDB/build_unix \
-I$LIBSH/protobuf-$PROTOBUF/src \
-I$LIBSH/$MINIUPNPC \
-I$LIBSH/$LIBPNG \
-I$LIBSH/libevent-$LIBEVENT-stable/include \
-I$LIBSH/qrencode-3.4.3 \
-DMINIUPNP_STATICLIB \
$ADDITIONALCCFLAGS"
export CPPFLAGS

# -I$LIBSH \

LDFLAGS="-L$LIBSH/$OPENSSL \
-L$LIBSH/$BERKELEYDB/build_unix \
-L$LIBSH/$MINIUPNPC/miniupnpc \
-L$LIBSH/$LIBPNG/.libs \
-L$LIBSH/protobuf-$PROTOBUF/src/.libs \
-L$LIBSH/libevent-$LIBEVENT-stable/.libs \
-L$LIBSH/qrencode-3.4.3/.libs"
export LDFLAGS

BOOST_ROOT=$LIBSH/$BOOST
export BOOST_ROOT

./configure \
--host=i686-w64-mingw32.static \
--build=i686-w64-mingw32.static \
--disable-upnp-default \
--disable-tests \
--with-qt-incdir=$QTPATHMSYS/include \
--with-qt-libdir=$QTPATHMSYS/lib \
--with-qt-plugindir=$QTPATHMSYS/plugins \
--with-qt-bindir=$QTPATHMSYS/bin \
--with-protoc-bindir=$LIBSH/protobuf-$PROTOBUF/src \
--with-gui=qt5
# --disable-hardening
# --enable-debug

if [ ${?} -ne 0 ]; then echo "client configure failed."; read -n 1 -s; exit 1;fi

#make
mingw32-make
if [ ${?} -ne 0 ]; then echo "client make failed."; read -n 1 -s; exit 1;fi

strip ./src/*.exe
strip ./src/qt/*.exe

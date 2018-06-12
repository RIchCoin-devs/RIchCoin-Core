cd $LIB

echo libevent...
cd libevent-$LIBEVENT-stable
./configure --disable-shared --disable-openssl --disable-libevent-regress --disable-debug-mode
if [ ${?} -ne 0 ]; then echo "Libevent config failed."; read -n 1 -s; exit 1;fi
make
if [ ${?} -ne 0 ]; then echo "Libevent make failed."; read -n 1 -s; exit 1;fi
cd ..

echo db...
cd $BERKELEYDB
cd build_unix
../dist/configure --disable-replication --enable-mingw --enable-cxx --disable-shared\
 CXXFLAGS="${ADDITIONALCCFLAGS}" \
 CFLAGS="${ADDITIONALCCFLAGS}"
if [ ${?} -ne 0 ]; then echo "BerkeleyDB configure failed."; read -n 1 -s; exit 1;fi
sed -i 's/typedef pthread_t db_threadid_t;/typedef u_int32_t db_threadid_t;/g' db.h  # workaround, see https://bitcointalk.org/index.php?topic=45507.0
make
if [ ${?} -ne 0 ]; then echo "BerkeleyDB make failed."; read -n 1 -s; exit 1;fi
cd ..
cd ..
echo

echo  openssl...
cd $OPENSSL
export CC="gcc ${ADDITIONALCCFLAGS}"
./config
if [ ${?} -ne 0 ]; then echo "OpenSSL config failed."; read -n 1 -s; exit 1;fi
make
if [ ${?} -ne 0 ]; then echo "OpenSSL make failed."; read -n 1 -s; exit 1;fi
cd ..
echo

echo libpng...
cd $LIBPNG
./configure --disable-shared
if [ ${?} -ne 0 ]; then echo "Libpng config failed."; read -n 1 -s; exit 1;fi
make
if [ ${?} -ne 0 ]; then echo "Libpng config failed."; read -n 1 -s; exit 1;fi
cp .libs/libpng16.a .libs/libpng.a
cd ..

echo protobuf...
cd protobuf-$PROTOBUF
./autogen.sh
if [ ${?} -ne 0 ]; then echo "protobuf autogen failed."; read -n 1 -s; exit 1;fi
./configure --disable-shared
if [ ${?} -ne 0 ]; then echo "protobuf configure failed."; read -n 1 -s; exit 1;fi
make
if [ ${?} -ne 0 ]; then echo "protobuf make failed."; read -n 1 -s; exit 1;fi
cd ..
echo

echo qrencode...
cd $QRENCODE
LIBS="../libpng-1.6.9/.libs/libpng16.a ../../mingw32/i686-w64-mingw32/lib/libz.a" \
png_CFLAGS="-I../libpng-1.6.9" \
png_LIBS="-L../libpng-1.6.9/.libs" \
configure --enable-static --disable-shared
if [ ${?} -ne 0 ]; then echo "qrencode configure failed."; read -n 1 -s; exit 1;fi
make
if [ ${?} -ne 0 ]; then echo "qrencode make failed."; read -n 1 -s; exit 1;fi
cd ..
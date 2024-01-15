export APP_VERSION="1.0.1"

echo -n "Building amd64 deb..........."
debdir=bin/zdeex-qt-ubuntu1804-v$APP_VERSION
mkdir -p $debdir > /dev/null
mkdir    $debdir/DEBIAN
mkdir -p $debdir/usr/local/bin

cat zcutil/deb/control_amd64 | sed "s/RELEASE_VERSION/$APP_VERSION/g" > $debdir/DEBIAN/control

cp release/zdeex-qt-linux                   $debdir/usr/local/bin/zdeex-qt

mkdir -p $debdir/usr/share/pixmaps/
cp zcutil/deb/zdeex.xpm           $debdir/usr/share/pixmaps/

mkdir -p $debdir/usr/share/applications
cp zcutil/deb/desktopentry    $debdir/usr/share/applications/zdeex-qt.desktop

dpkg-deb --build $debdir >/dev/null
cp $debdir.deb                 release/zdeex-qt-ubuntu1804-v$APP_VERSION.deb
rm ./bin -rf
echo "[OK]"


echo -n "Building aarch64 deb..........."
debdir=bin/zdeex-qt-arrch64-v$APP_VERSION
mkdir -p $debdir > /dev/null
mkdir    $debdir/DEBIAN
mkdir -p $debdir/usr/local/bin

cat zcutil/deb/control_aarch64 | sed "s/RELEASE_VERSION/$APP_VERSION/g" > $debdir/DEBIAN/control

cp release/zdeex-qt-arm                   $debdir/usr/local/bin/zdeex-qt

mkdir -p $debdir/usr/share/pixmaps/
cp zcutil/deb/zdeex.xpm           $debdir/usr/share/pixmaps/

mkdir -p $debdir/usr/share/applications
cp zcutil/deb/desktopentry    $debdir/usr/share/applications/zdeexwallet-qt.desktop

dpkg-deb --build $debdir >/dev/null
cp $debdir.deb                 release/zdeex-qt-aarch64-v$APP_VERSION.deb
rm ./bin -rf
echo "[OK]"

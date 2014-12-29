#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 6381568 257d45e1301b8a3445b1562b55367c919f5ccc02 3528704 19195c62cb6491255ae2b18b7838fb3550d45efa
fi

if ! applypatch -c EMMC:/dev/block/mmcblk0p13:6381568:257d45e1301b8a3445b1562b55367c919f5ccc02; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/mmcblk0p8:3528704:19195c62cb6491255ae2b18b7838fb3550d45efa EMMC:/dev/block/mmcblk0p13 257d45e1301b8a3445b1562b55367c919f5ccc02 6381568 19195c62cb6491255ae2b18b7838fb3550d45efa:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi

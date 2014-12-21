#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 5742592 4d2b35687097a92680d58e5f468c13bda5d6ac6b 3502080 514c963f2f30a9fad91e942fc5d321a0d7fd84ab
fi

if ! applypatch -c EMMC:/dev/block/mmcblk0p13:5742592:4d2b35687097a92680d58e5f468c13bda5d6ac6b; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/mmcblk0p8:3502080:514c963f2f30a9fad91e942fc5d321a0d7fd84ab EMMC:/dev/block/mmcblk0p13 4d2b35687097a92680d58e5f468c13bda5d6ac6b 5742592 514c963f2f30a9fad91e942fc5d321a0d7fd84ab:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi

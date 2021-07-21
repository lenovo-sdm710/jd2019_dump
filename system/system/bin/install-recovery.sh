#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:83dd61a2f5953738958dcdf9a4750cdd8c34cb68; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:d631b22497493f1fc8570b2422720f96fbc9dcf2 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:83dd61a2f5953738958dcdf9a4750cdd8c34cb68 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

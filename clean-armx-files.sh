#!/bin/bash

cd files/
echo "Cleaning files/armx/share/qemu"
rm -Rf armx/share/qemu
echo "Cleaning files/armx/hostfs/hostfs.ext2"
rm -f armx/hostfs/hostfs.ext2
echo "Cleaning files/armx/run/debug"
rm -f armx/run/debug
echo "Cleaning files/armx/run/logs/*.log"
rm -f armx/run/logs/*.log
echo "Cleaning up flash[01].bin files"
find . -name "flash[01].bin" -print -exec rm {} \;
echo "Cleaning up extracted rootfs"
for i in $(find armx -name "config" -print)
do
   path=$(dirname $i)
   rootfs=$(cat $i | grep rootfs | cut -d'=' -f2)
   if [ -d ${path}/${rootfs} ]
   then
      echo "removing ${path}/${rootfs}"
      rm -Rf "${path}/${rootfs}"
   fi
done
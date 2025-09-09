#!/bin/bash

kernname=`uname -r`
boot_dir=/boot
vmlinuz="$boot_dir/vmlinuz-$kernname"
initramfs="$boot_dir/initramfs-$kernname.img"
root_dev=`cat /proc/cmdline  | sed 's/ /\n/g' | grep ^root= | cut -f2- -d'='`

echo /usr/bin/kexec -p "$vmlinuz" --initrd="$initramfs" --append="root=$root_dev single irqpoll maxcpus=1 reset_devices"
/usr/bin/kexec -p "$vmlinuz" --initrd="$initramfs" --append="root=$root_dev single irqpoll maxcpus=1 reset_devices"
echo "kexec comman executed"

exit 0

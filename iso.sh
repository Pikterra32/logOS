#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/logos.kernel isodir/boot/logos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "logos" {
	multiboot /boot/logos.kernel
}
EOF
grub2-mkrescue -o logos.iso isodir

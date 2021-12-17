#!/bin/sh
MKIMAGE=$HOST_DIR/bin/mkimage
$MKIMAGE -A arm64 -O linux -T kernel -C none -a 0x1080000 -e 0x1080000 -n linux-next -d "${BINARIES_DIR}/Image" "${BINARIES_DIR}/uImage"

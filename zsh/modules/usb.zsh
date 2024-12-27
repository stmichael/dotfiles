usb-mount() {
  sudo mount --mkdir -o gid=users,fmask=113,dmask=002 /dev/sda /mnt/usbstick
  echo "USB device available at /mnt/usbstick"
}

usb-umount() {
  sudo umount /mnt/usbstick
}

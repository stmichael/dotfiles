usb-mount-stick() {
  sudo mount --mkdir -o uid=$USER,gid=$USER /dev/sda1 /mnt/usb
  echo "USB device available at /mnt/usb"
}

usb-mount-disc() {
  sudo mount --mkdir -t ext4 /dev/sda1 /mnt/usb
  echo "USB device available at /mnt/usb"
}

usb-umount() {
  sudo umount /mnt/usb
}

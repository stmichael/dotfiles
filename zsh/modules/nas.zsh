HOME_MOUNT_POINT=/var/run/media/$USER/home
SHARED_MOUNT_POINT=/var/run/media/$USER/Gemeinsam

nas-mount-home() {
  sudo mount --mkdir -t nfs -o vers=4 HueNAS:/volume1/homes/stmichael $HOME_MOUNT_POINT
  echo "NAS available at $HOME_MOUNT_POINT"
}

nas-umount-home() {
  sudo umount $HOME_MOUNT_POINT
}

nas-mount-shared() {
  sudo mount --mkdir -t nfs -o vers=4 HueNAS:/volume1/Gemeinsam $SHARED_MOUNT_POINT
  echo "NAS available at $SHARED_MOUNT_POINT"
}

nas-umount-shared() {
  sudo umount $SHARED_MOUNT_POINT
}

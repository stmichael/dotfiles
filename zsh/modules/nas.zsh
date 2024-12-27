nas-mount() {
  sudo mount --mkdir -t nfs -o vers=4 192.168.0.20:/volume1/homes/stmichael /mnt/nas
  echo "NAS available at /mnt/nas"
}

nas-umount() {
  sudo umount /mnt/nas
}

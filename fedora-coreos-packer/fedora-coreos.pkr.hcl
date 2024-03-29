source "virtualbox-iso" "autogenerated_1" {
  boot_command         = [
    "<enter>", 
    "<wait30s>", 
    "sudo /usr/bin/coreos-installer install -I ${var.ignition_url} ${var.ignition_hash} -u ${var.raw_url} /dev/sda", 
    "<enter>", 
    "<wait2m>", 
    "reboot", 
    "<enter>", 
    "<wait30s>"
  ]
  boot_wait            = "5s"
  guest_os_type        = "Linux_64"
  iso_checksum         = "sha256:${var.iso_checksum}"
  iso_url              = "${var.iso_url}"
  memory               = 3072
  shutdown_command     = "sudo /sbin/shutdown -P -h now"
  ssh_private_key_file = "id_rsa"
  ssh_username         = "core"
}

build {
  sources = ["source.virtualbox-iso.autogenerated_1"]

  post-processor "vagrant" {
    compression_level = 9
    output            = "fedora-coreos.box"
  }
}
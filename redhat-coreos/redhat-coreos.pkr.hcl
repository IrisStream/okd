source "virtualbox-iso" "autogenerated_1" {
  boot_command         = [
    "<enter>", 
    "<wait20s>", 
    "curl -o /tmp/ignition.cfg http://{{ .HTTPIP }}:{{ .HTTPPort }}/ignition.cfg",
    "<enter>",
    "curl -o /tmp/rhcos-metal.x86_64.raw.gz http://{{ .HTTPIP }}:{{ .HTTPPort }}/rhcos-metal.x86_64.raw.gz",
    "<enter>",
    "ls -la /tmp",
    "<enter>",
    "sudo /usr/bin/coreos-installer install -I http://{{ .HTTPIP }}:{{ .HTTPPort }}/ignition.cfg ${var.ignition_hash} -u http://{{ .HTTPIP }}:{{ .HTTPPort }}/rhcos-metal.x86_64.raw.gz /dev/sda",
    "<enter>", 
    "<wait2m>", 
    "reboot", 
    "<enter>", 
    "<wait30s>"
  ]
  boot_wait            = "5s"
  guest_os_type        = "Linux_64"
  http_directory       = "http"
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
    output            = "redhat-coreos.box"
  }
}
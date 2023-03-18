
source "virtualbox-iso" "autogenerated_1" {
  boot_command = [
    "<tab><bs><bs><bs><bs><bs>inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.kickstart}<enter><wait>",
    "<wait10><wait10><wait10>",
    "<wait10><wait10><wait10>",
    "<wait10><wait10><wait10>",
    "<wait10><wait10><wait10>",
    "<wait10><wait10><wait10>",
    "<wait10><wait10><wait10>",
    "<wait10><wait10><wait10>",
    "<wait10><wait10><wait10>",
    "<wait10><wait10><wait10>",
    "<wait10><wait10><wait10>",
    "<wait10><wait10><wait10>",
    "<wait10><wait10><wait10>"
  ]
  boot_wait               = "10s"
  disk_size               = 32768
  guest_additions_mode    = "${var.guest_additions}"
  guest_additions_path    = "VBoxGuestAdditions_{{ .Version }}.iso"
  guest_os_type           = "RedHat8_64"
  http_directory          = "http"
  iso_checksum            = "${var.iso_checksum}"
  iso_url                 = "${var.iso_url}"
  shutdown_command        = "echo 'vagrant'| sudo -S /sbin/poweroff"
  ssh_password            = "vagrant"
  ssh_private_key_file    = "id_rsa"
  ssh_port                = 22
  ssh_timeout             = "30m"
  ssh_username            = "vagrant"
  vboxmanage = [
    [ "modifyvm", "{{.Name}}", "--nat-localhostreachable1", "on"], // Virtualbox v7 compatibility issue with packer v1.8.5 https://github.com/hashicorp/packer/issues/12118
    [ "modifyvm", "{{.Name}}", "--memory", "1024" ],
    [ "modifyvm", "{{.Name}}", "--cpus", "2" ],
    [ "modifyvm", "{{.Name}}", "--vram", "128" ],
    [ "modifyvm", "{{.Name}}", "--graphicscontroller", "vmsvga" ]
  ]
  virtualbox_version_file = ".vbox_version"
}

build {
  description = "Build base CentOS 8 Stream x86_64"

  sources = ["source.virtualbox-iso.autogenerated_1"]

  provisioner "shell" {
    execute_command = "echo 'packer'|{{ .Vars }} sudo -S -E bash '{{ .Path }}'"
    environment_vars = ["guest_additions_mode=${var.guest_additions}"]
    scripts         = [
      "scripts/02vagrant.sh",
      "scripts/90virtualbox.sh",
      "scripts/98cleanup.sh",
      "scripts/99minimize.sh"
    ]
  }

  post-processor "vagrant" {
    compression_level    = 9
    output               = "${var.box_name}.box"
  }
}

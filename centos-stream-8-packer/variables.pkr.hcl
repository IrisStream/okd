variable "iso_checksum" {
  type = string
}

variable "iso_url" {
  type = string
}

variable "guest_additions" {
  type    = string
  default = "upload"
}

variable "kickstart" {
  type    = string
  default = "kickstart.cfg"
}

variable "proxy" {
  type    = string
  default = "${env("http_proxy")}"
}

variable "box_name" {
  type    = string
  default = "centos8-stream-x86_64"
}
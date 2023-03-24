variable "ignition_hash" {
  type = string
}

variable "ignition_url" {
  type = string
}

variable "iso_checksum" {
  type = string
}

variable "iso_url" {
  type = string
}

variable "raw_url" {
  type = string
}

variable "guest_additions" {
  type    = string
  default = "upload"
}
packer {
  required_plugins {
    qemu = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/qemu"
    }
  }
}

variable "ubuntu_version" {
  default = "24.04"
}

variable "iso_url" {
  default = "../iso/ubuntu-24.04.1-live-server-amd64.iso"
}

variable "iso_checksum" {
  default = "sha256:e240e4b801f7bb68c20d1356b60968ad0c33a41d00d828e74ceb3364a0317be9"
}

source "qemu" "ubuntu-libvirt" {
  accelerator      = "kvm"
  iso_url          = var.iso_url
  iso_checksum     = var.iso_checksum
  output_directory = "output/ubuntu-${var.ubuntu_version}"
  disk_size        = 10240
  format           = "qcow2"
  headless         = true
  http_directory   = "http"
  ssh_username     = "packer"
  ssh_password     = "packer"
  ssh_wait_timeout = "20m"
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
  boot_command = [
    "<esc><wait>",
    "linux /casper/vmlinuz --- autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ <enter><wait>",
    "initrd /casper/initrd <enter><wait>",
    "boot <enter><wait>"
  ]
  vm_name = "ubuntu-${var.ubuntu_version}"
  cpus    = 2
  memory  = 2048
}

build {
  sources = ["source.qemu.ubuntu-libvirt"]

  provisioner "shell" {
    inline = [
      "sudo apt update",
      "sudo apt upgrade -y",
      "sudo apt install -y qemu-guest-agent"
    ]
  }
}

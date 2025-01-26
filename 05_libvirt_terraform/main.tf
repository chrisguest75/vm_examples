terraform {
  backend "local" {
    path = "./state/terraform.tfstate"
  }

  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}


locals {
}

#################################################
## Resources
#################################################

resource "libvirt_domain" "default" {
  name = "test"

  memory = "2048"
  vcpu   = 2

  disk {
    file = "../iso/ubuntu-24.04.1-live-server-amd64.iso"
  }
}




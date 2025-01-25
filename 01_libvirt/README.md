# LIBVIRT

Build a simple VM using libvirt.  

TODO:

* Prep ubuntu automatically
* details on vm
* attach a bridge network

## Nix

```sh
# enter nix shell
just nix
```

## ISO

```sh
# download ubuntu iso
just iso
```

## Bridge

The default network seems to be missing on NixOS

```sh
virsh net-list --all

# create "default" bridge network
export NETWORK_NAME=default
virsh net-define ./${NETWORK_NAME}.xml
sudo virsh net-start ${NETWORK_NAME}
virsh net-autostart ${NETWORK_NAME}
```

## Install

```sh
# list supported OSes
virt-install --osinfo list

# it should be possible to ssh after creation.
just machine-create

# go to QEMU/KVM user session
just manager
```

## Connect

```sh
just machine-connect
```

## Cleanup

```sh
just machine-destroy

# remove bridge
virsh net-destroy ${NETWORK_NAME}
virsh net-undefine ${NETWORK_NAME}

# looks for old disks
find / -iname "*.qcow2"
ls -l /home/$USER/.local/share/libvirt/images/
```

## Resources

* The libvirt project [here](https://libvirt.org/)
* How to get started with libvirt on Linux [here](https://rabexc.org/posts/how-to-get-started-with-libvirt-on)
* How to use bridged networking with libvirt and KVM [here](https://linuxconfig.org/how-to-use-bridged-networking-with-libvirt-and-kvm)
* Setting up KVM virtual machines using a bridge network on an Ubuntu host [here](https://www.dzombak.com/blog/2024/02/Setting-up-KVM-virtual-machines-using-a-bridged-network.html)
* KVM - Fix Missing Default Network [here](https://blog.programster.org/kvm-missing-default-network)

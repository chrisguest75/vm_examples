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

```sh
virsh net-list --all

# create
export NETWORK_NAME=default
virsh net-define ./${NETWORK_NAME}.xml
sudo virsh net-start ${NETWORK_NAME}
virsh net-autostart ${NETWORK_NAME}
```

## Install

```sh
virt-install --osinfo list

# it should be possible to ssh after creation.
just create

# go to QEMU/KVM user session
just manager
```

## Connect

```sh
virt-viewer --connect qemu:///session --wait ubuntu-testing
```

## Cleanup

```sh
just destroy

# remove bridge
virsh net-destroy ${NETWORK_NAME}
virsh net-undefine ${NETWORK_NAME}


find / -iname "*.qcow2"

ls -l /home/$USER/.local/share/libvirt/images/
```

## Resources

* https://libvirt.org/
* https://rabexc.org/posts/how-to-get-started-with-libvirt-on
* https://linuxconfig.org/how-to-use-bridged-networking-with-libvirt-and-kvm
* https://www.dzombak.com/blog/2024/02/Setting-up-KVM-virtual-machines-using-a-bridged-network.html
* KVM - Fix Missing Default Network [here](https://blog.programster.org/kvm-missing-default-network)

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
virsh net-define ./hostbridge.xml
virsh net-start hostbridge
virsh net-autostart hostbridge
```

## Install

```sh
virt-install --osinfo list

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
virsh net-destroy hostbridge
virsh net-undefine hostbridge


find / -iname "*.qcow2"

ls -l /home/$USER/.local/share/libvirt/images/
```

## Resources

* https://libvirt.org/
* https://rabexc.org/posts/how-to-get-started-with-libvirt-on
* https://linuxconfig.org/how-to-use-bridged-networking-with-libvirt-and-kvm
* https://www.dzombak.com/blog/2024/02/Setting-up-KVM-virtual-machines-using-a-bridged-network.html
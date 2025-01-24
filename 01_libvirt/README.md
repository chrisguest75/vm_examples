# LIBVIRT

Build a simple VM using libvirt.  

TODO:

* Prep ubuntu automatically
* delete vm
* details on vm

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

## Install

```sh
virt-install --osinfo list

just create

# go to QEMU/KVM user session
virt-manager
```

## Resources

* https://libvirt.org/
* https://rabexc.org/posts/how-to-get-started-with-libvirt-on

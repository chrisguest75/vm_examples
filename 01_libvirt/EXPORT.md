# EXPORT

Export VMs for backups and imports into other machines.  

## Contents

- [EXPORT](#export)
  - [Contents](#contents)
  - [Export](#export-1)
    - [Export Details and Drive](#export-details-and-drive)
    - [Copy](#copy)
    - [Import](#import)
  - [Clone](#clone)
  - [Resources](#resources)

## Export

### Export Details and Drive

```sh
# export details and print out drive location
just machine-export ubuntu-autoinstall
cp /home/chrisguest/.local/share/libvirt/images/ubuntu-autoinstall.qcow2 ./machines
```

### Copy

```sh
# TODO: comporess the qcow2 file
scp ./machines/* chrisguest@${MACHINE}:/<path>/machines
```

### Import

```sh
virsh define ubuntu-autoinstall.xml
virsh edit ubuntu-autoinstall
virsh start ubuntu-autoinstall
```

## Clone

```sh
# cloning is not working yet
just machine-clone ubuntu-autoinstall
```

## Resources


# EXPORT

Export VMs for backups and imports into other machines.  

NOTES:

* error: operation failed: guest CPU doesn't match specification: missing features: sgx,mpx,rdseed,adx,smap,clflushopt,sgxlc,xsavec,xgetbv1,xsaves,sgx1,sgx-edeccssa,sgx-debug,sgx-mode64,sgx-provisionkey,sgx-tokenkey,sgx-aex-notify,3dnowprefetch,rsba,vmx-encls-exit,vmx-rdseed-exit,vmx-xsaves,vmx-exit-clear-bndcfgs,vmx-entry-load-bndcfgs

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

Enusre the networks exist to be able to start the machine.  

```sh
# define machine
virsh define ./machines/ubuntu-autoinstall.xml

# alter drive location
virsh edit ubuntu-autoinstall

# might not start based on cpu architecture differences
virsh start ubuntu-autoinstall
```

## Clone

```sh
# cloning is not working yet
just machine-clone ubuntu-autoinstall
```

## Resources

* https://github.com/Fmstrat/winapps/issues/42
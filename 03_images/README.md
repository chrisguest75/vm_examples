# IMAGES

Convert `qcow2` format to `vhdx`.  

## Convert

```sh
qemu-img convert -f qcow2 -O vhdx /home/$USER/.local/share/libvirt/images/ubuntu-autoinstall-1.qcow2 /home/$USER/.local/share/libvirt/images/ubuntu-autoinstall-1.vhd   
```

## Resources

* converting qcow2 to vhdx https://www.vinchin.com/vm-migration/convert-vhd-vhdx-to-qcow2.html

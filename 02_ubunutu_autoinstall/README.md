# AUTOINSTALL

NOTES:

* Installations generate `/var/log/installer/autoinstall-user-data`
* Older versions of Ubuntu used to use preseed.  


TODO:

* Get a copy of autoinstall script
* Use it to deploy a libvirt machine.
* Install my chezmoi script.

## Expand ISO

```sh
just nix

just unpack

mv  '[BOOT]' ../BOOT
```

## Settings

```sh
xorriso -indev ../iso/ubuntu-24.04.1-live-server-amd64.iso -report_el_torito as_mkisofs
```

## Build

```sh
xorriso -as mkisofs -r \
  -V 'Ubuntu-Server 24.04.1 LTS amd64' \
  -o ../../iso/ubuntu-24.04-custom-autoinstall.iso \
  --grub2-mbr ../BOOT/1-Boot-NoEmul.img \
  -partition_offset 16 \
  --mbr-force-bootable \
  -append_partition 2 28732ac11ff8d211ba4b00a0c93ec93b ../BOOT/2-Boot-NoEmul.img \
  -appended_part_as_gpt \
  -iso_mbr_part_type a2a0d0ebe5b9334487c068b6b72699c7 \
  -c '/boot.catalog' \
  -b '/boot/grub/i386-pc/eltorito.img' \
    -no-emul-boot -boot-load-size 4 -boot-info-table --grub2-boot-info \
  -eltorito-alt-boot \
  -e '--interval:appended_partition_2:::' \
  -no-emul-boot \
  .
```

## Resources

* Ubuntu 22.04 Server Autoinstall ISO [here](https://www.pugetsystems.com/labs/hpc/ubuntu-22-04-server-autoinstall-iso/?srsltid=AfmBOoobWRvGqVGtViRsEGG9TCNOB6eDCaJrqHdS65qUuV-bvkmh8Qog)
* https://canonical-subiquity.readthedocs-hosted.com/en/latest/tutorial/creating-autoinstall-configuration.html
* https://canonical-subiquity.readthedocs-hosted.com/en/latest/tutorial/providing-autoinstall.html#providing-autoinstall
* https://github.com/canonical/subiquity

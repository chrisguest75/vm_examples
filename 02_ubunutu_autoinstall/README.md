# AUTOINSTALL

NOTES:

* Installations generate `/var/log/installer/autoinstall-user-data`
* Older versions of Ubuntu used to use preseed.  
* `user-data-3` creates full volume size

TODO:

* Install my chezmoi script.

## Expand ISO

```sh
just nix

just image-unpack
```

## Settings

```sh
# discover original iso image build settings
xorriso -indev ../iso/ubuntu-24.04.1-live-server-amd64.iso -report_el_torito as_mkisofs
```

## Build

```sh
mkpasswd

# create iso image
just image-build user-data-3

# create machine
just machine-create "my-new-machine"
```

## Finalise provisioning

Depending on the `user-data` chosen you may need to expand the volume.  

### Volume size

```sh
# get ip of vm on virt-viewer
ip addr

# ssh 
ssh 192.168.122.189

# extend volume
lvextend -L +10G /dev/mapper/ubuntu--vg-ubuntu--lv 
resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv 
```

### Chezmoi

REF: [github.com/chrisguest75/chezmoi_dotfiles](https://github.com/chrisguest75/chezmoi_dotfiles)

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply chrisguest75/chezmoi_dotfiles
```

## Resources

* Ubuntu 22.04 Server Autoinstall ISO [here](https://www.pugetsystems.com/labs/hpc/ubuntu-22-04-server-autoinstall-iso/?srsltid=AfmBOoobWRvGqVGtViRsEGG9TCNOB6eDCaJrqHdS65qUuV-bvkmh8Qog)
* Creating autoinstall configuration [here](https://canonical-subiquity.readthedocs-hosted.com/en/latest/tutorial/creating-autoinstall-configuration.html)
* Providing autoinstall configuration [here](https://canonical-subiquity.readthedocs-hosted.com/en/latest/tutorial/providing-autoinstall.html#providing-autoinstall)
* canonical/subiquity [repo](https://github.com/canonical/subiquity)
* Getting started with Autoinstall on Ubuntu Desktop 24.04 LTS https://blog.local-optimum.net/getting-started-with-autoinstall-on-ubuntu-desktop-24-04-lts-147a1defb2de
* Getting your feet wet with Ubuntu Autoinstall https://medium.com/@Phoenixforge/getting-your-feet-wet-with-ubuntu-autoinstall-e2c012454a37
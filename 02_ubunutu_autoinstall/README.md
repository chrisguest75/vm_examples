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

just image-unpack
```

## Settings

```sh
# discover original iso image build settings
xorriso -indev ../iso/ubuntu-24.04.1-live-server-amd64.iso -report_el_torito as_mkisofs
```

## Build

```sh
# create iso image
just image-build

# create machine
just machine-build
```

## Chezmoi

REF: [github.com/chrisguest75/chezmoi_dotfiles](https://github.com/chrisguest75/chezmoi_dotfiles)

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply chrisguest75/chezmoi_dotfiles
```

## Resources

* Ubuntu 22.04 Server Autoinstall ISO [here](https://www.pugetsystems.com/labs/hpc/ubuntu-22-04-server-autoinstall-iso/?srsltid=AfmBOoobWRvGqVGtViRsEGG9TCNOB6eDCaJrqHdS65qUuV-bvkmh8Qog)
* Creating autoinstall configuration [here](https://canonical-subiquity.readthedocs-hosted.com/en/latest/tutorial/creating-autoinstall-configuration.html)
* Providing autoinstall configuration [here](https://canonical-subiquity.readthedocs-hosted.com/en/latest/tutorial/providing-autoinstall.html#providing-autoinstall)
* canonical/subiquity [repo](https://github.com/canonical/subiquity)


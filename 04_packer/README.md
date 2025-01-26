# PACKER

Use packer to build a virtual machine disk.  

TODO:

* This is not working yet.
* Split into a libvirt and qemu example

## Start

```sh
just nix
```

## Build

```sh
just init

# get the sha256 
cat "../iso/ubuntu-24.04.1-live-server-amd64.iso" | openssl dgst -sha256

just build

# Connect to: vnc://127.0.0.1:5973
```

## Resources

* Automate image builds with Packer [here](https://www.packer.io/)
* https://github.com/thomasklein94/packer-plugin-libvirt/tree/main
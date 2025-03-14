# FIRECRACKER

Start a VM in firecracker.  

## Build rootfs

Build the rootfs [20_build_root/README.md](./20_build_root/README.md)  

## Start Firecracker

```sh
just nix

firecracker --help

dd if=/dev/zero of=rootfs.ext4 bs=1M count=50
mkfs.ext4 rootfs.ext4


firectl \
  --kernel=~/bin/vmlinux \
  --root-drive=/images/image-debootstrap.img -t \
  --cpu-template=T2 \
  --firecracker-log=~/firecracker-vmm.log \
  --kernel-opts="console=ttyS0 noapic reboot=k panic=1 pci=off nomodules rw" \
  --vsock-device=root:3 \
  --metadata='{"foo":"bar"}'


API_SOCKET="/tmp/firecracker.socket"
firecracker --api-sock "$API_SOCKET" --level Debug --log-path firecracker.log --show-log-origin --id fc-test


sudo ./firecracker --api-sock /tmp/firecracker.socket --config-file <path_to_the_configuration_file>
```

## Resources

* Secure and fast microVMs for serverless computing [here](https://firecracker-microvm.github.io/)
* Diving into Firecracker with Alpine [here](https://dev.to/l1x/diving-into-firecracker-with-alpine-2h2)
* A Nix Flake to build NixOS and run it on one of several Type-2 Hypervisors on NixOS/Linux. [here](https://github.com/astro/microvm.nix)
* Understanding Firecracker MicroVMs: The Next Evolution in Virtualization [here](https://medium.com/@meziounir/understanding-firecracker-microvms-the-next-evolution-in-virtualization-cb9eb8bbeede)
* Firectl is a basic command-line tool that lets you run arbitrary Firecracker MicroVMs via the command line. [here](https://github.com/firecracker-microvm/firectl)
* Firecracker supports uncompressed ELF kernel images on x86_64 while on aarch64 it supports PE formatted images. [here](https://github.com/firecracker-microvm/firecracker/blob/main/docs/rootfs-and-kernel-setup.md)
* Getting Started with Firecracker [here](https://github.com/firecracker-microvm/firecracker/blob/main/docs/getting-started.md)

# LIBVIRT TERRAFORM

Use terraform to deploy libvirt VM.  

TODO:

* This is not working - it doesn't build a vm but it creates a machine.  

## Nix

```sh
just nix 
```

## Create

```sh
just init

just plan

just apply
```

## Resources

* https://github.com/dmacvicar/terraform-provider-libvirt
* https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs
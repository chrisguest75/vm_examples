# VAGRANT

Use vagrant to install a machine on libvirt.  

TODO:

* Get chezmoi being installed from provisioner
* add just provision

## NIX

```sh
just nix
```

## Create

```sh
just up
```

## Connect

```powershell
# connect to the ssh
just ssh
```

### Chezmoi

REF: [github.com/chrisguest75/chezmoi_dotfiles](https://github.com/chrisguest75/chezmoi_dotfiles)

NOTE: default vagrant password is `vagrant`

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply chrisguest75/chezmoi_dotfiles
```

## Resources

* https://developer.hashicorp.com/vagrant/install

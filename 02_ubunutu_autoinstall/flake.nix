# flake.nix
{
    description = "A flake for building autoinstall Ubuntu ISOs";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    #       ↑ Swap it for your system if needed
    #       "aarch64-linux" / "x86_64-darwin" / "aarch64-darwin"
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {

      packages = [ 
          pkgs.p7zip 
          pkgs.libisoburn
          pkgs.yamllint
          pkgs.virt-manager 
          pkgs.virt-viewer
       ];

      env = {
      };

      shellHook = ''
        echo "***************************************************"
        echo "*** Welcome to autoinstall image builder"
        echo "***************************************************"
        echo ""
      '';       
    };
  };
}

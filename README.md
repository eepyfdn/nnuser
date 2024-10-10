<h1 align="center">nnuser</h1>

Truly declarative userspace management with Nix

## Approach

Instead of modifying the home directory directly like [home-manager](https://github.com/nix-community/home-manager), nnuser manages state by using an [overlayfs](https://wikipedia.org/wiki/OverlayFS), essentially the lower layer of the file system is the read-only directory within the Nix Store containing the declaratively configured files and then the upper layer is the user's real home directory meaning you get a perfect balance of both usability and reproducability.

## Installation

### Install via Flakes
```nix
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.nnuser = {
    url = "github:eepyfdn/nnuser";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nnuser }: {
    # change `yourhostname` to your actual hostname
    nixosConfigurations.yourhostname = nixpkgs.lib.nixosSystem {
      # change to your system
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        nnuser.nixosModules.nnuser
      ];
    };
  };
}
```
<h1 align="center">nnuser</h1>

Truly declarative userspace management with Nix

## Contents

* [Installation](#installation)
  * [flakes](#install-via-flakes)

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
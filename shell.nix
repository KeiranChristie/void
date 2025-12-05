{ system ? builtins.currentSystem
, pkgs ? import (builtins.fetchTarball "https://channels.nixos.org/nixos-24.11/nixexprs.tar.xz") {
    inherit system;
    config.allowUnfree = true;
  }
}:

import ./nix/shell.nix { inherit pkgs; }


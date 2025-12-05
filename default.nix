{ system ? builtins.currentSystem
, pkgs ? import (builtins.fetchTarball "https://channels.nixos.org/nixos-24.11/nixexprs.tar.xz") {
    inherit system;
    config.allowUnfree = true;
  }
}:

# Build the Void desktop package without requiring flakes or NIX_PATH.
pkgs.callPackage ./nix/void.nix { }


{
  description = "Nix flake to build the Void desktop app from source";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      voidPkg = pkgs.callPackage ./nix/void.nix { };
    in
    {
      packages.${system} = {
        default = voidPkg;
        void = voidPkg;
      };

      apps.${system} = {
        default = {
          type = "app";
          program = "${voidPkg}/bin/void";
        };
      };

      devShells.${system}.default = import ./nix/shell.nix { inherit pkgs; };
    };
}


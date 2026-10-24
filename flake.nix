{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    jovian = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = inputs@{ nixpkgs, jovian, chaotic, ... }:
  # let
  #   jovian = chaotic.vendored.jovian;
  # in
  {
    nixosConfigurations.hermes = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/hermes/default.nix
        jovian.nixosModules.default
        # chaotic.nixosModules.default
      ];
    };
  };
}

{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    jovian = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    space-grotesk.url = "github:xfeusw/space-grotesk-flake";

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      jovian,
      chaotic,
      home-manager,
      plasma-manager,
      ...
    }:
    let
      inherit (chaotic.vendored) jovian;
    in
    {
      nixosConfigurations.hermes = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./hosts/hermes
          jovian.nixosModules.default
          chaotic.nixosModules.default
          home-manager.nixosModules.home-manager

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              extraSpecialArgs = {
                inherit inputs;
              };

              sharedModules = [
                inputs.chaotic.homeModules.default
                plasma-manager.homeModules.plasma-manager
              ];

              users.xfeusw = import ./homes/xfeusw;
            };
          }
        ];
      };
    };
}

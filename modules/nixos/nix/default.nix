{ ... }:

{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    substituters = [
      "https://cache.iog.io"
      "https://cache.nixos.org"

      "https://jovian.cachix.org"
      "https://cache.xinux.uz"
      "https://nixpkgs.cachix.org"
      "https://chaotic-nyx.cachix.org"
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="

      "jovian.cachix.org-1:8Vq4Txku6VZIRhYrHYki3Ab9XHJRoWmdYqMqj4rB/Uc="
      "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
      "nixpkgs.cachix.org-1:q91R6hxbwFvDqTSDKwDAV4T5PxqXGxswD8vhONFMeOE="
      "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    trusted-users = [
      "root"
      "xfeusw"
    ];
  };

  nixpkgs.config.allowUnfree = true;
}

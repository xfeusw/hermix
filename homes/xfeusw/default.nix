{ pkgs, inputs, ... }:
let
  telegram-desktop = inputs.chaotic.packages.${pkgs.stdenv.hostPlatform.system}.telegram-desktop_git;
  zen-browser = inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs;
    };

    sharedModules = [
      inputs.chaotic.homeModules.default
    ];

    users.xfeusw = {
      imports = [
        # ../../modules/home/haskell
        ../../modules/home/nix
        ../../modules/home/rust
        ../../modules/home/spicetify
        ../../modules/home/starship
        ../../modules/home/wezterm
        ../../modules/home/zed
        ../../modules/home/zsh
      ];

      home.username = "xfeusw";
      home.homeDirectory = "/home/xfeusw";
      home.stateVersion = "26.11";

      programs.home-manager.enable = true;

      home.packages = with pkgs; [
        git
        helix
        fastfetch
        # spotify
        gh
      ] ++ [
        telegram-desktop
        zen-browser
      ];
    };
  };
}

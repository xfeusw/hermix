{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:
let
  telegram-desktop = inputs.chaotic.packages.${pkgs.stdenv.hostPlatform.system}.telegram-desktop_git;
  zen-browser = inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;

  homeModules = lib.lists.map (x: lib.path.append ../../modules/home x) [
    # "haskell"
    "nix"
    "plasma"
    "rust"
    # "spicetify"
    "starship"
    # "wezterm"
    "zed"
    "zsh"
  ];
in
{
  imports = homeModules;

  nix.extraOptions = ''
    !include ${config.xdg.configHome}/nix/access-tokens.conf
  '';

  home.username = "xfeusw";
  home.homeDirectory = "/home/xfeusw";
  home.stateVersion = "26.11";

  programs.home-manager.enable = true;

  home.packages =
    with pkgs;
    [
      git
      helix
      fastfetch
      # spotify
      gh
      element-desktop
      nerd-fonts.jetbrains-mono
    ]
    ++ [
      telegram-desktop
      zen-browser
    ];
}

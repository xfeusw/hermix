{ pkgs, inputs, ... }:
let
  zed = inputs.chaotic.packages.${pkgs.stdenv.hostPlatform.system}.zed-editor_git;
in
{
  programs.zed-editor = {
    enable = true;

    package = zed;

    # userKeymaps = import ./keymaps.nix {};

    userSettings = import ./settings.nix { inherit pkgs; };

    extensions = import ./extensions.nix;
  };
}

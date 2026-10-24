{pkgs, ...}:

{
  home.packages = with pkgs; [
    nixd
    nixfmt
    statix
    deadnix

    # treefmt
    nh
    nix-output-monitor

    nix-tree
    nix-diff
    nvd
    nix-index
    nix-du
    nix-melt
    optnix

    nurl
    nix-init
  ];
}

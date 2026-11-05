{
  den.aspects.dev-tools = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        git
        vim
        tmux
        helix
        zed-editor
      ];
    };
  };
}

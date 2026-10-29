{
  config,
  pkgs,
  lib,
  ...
}:

{
  jovian = {
    steam = {
      enable = true;
      autoStart = true;
      desktopSession = "plasma";
      user = "xfeusw";
    };
    steamos = {
      useSteamOSConfig = true;
    };
    # decky-loader = {
    #   enable = true;
    #   user = "xfeusw";
    # };
    devices = {
      steamdeck = {
        enable = true;
      };
    };
    hardware.has.amd.gpu = true;
  };

  # environment.variables = {
  #   NIXOS_OZONE_WL = "1";
  #   ELECTRON_OZONE_PLATFORM_HINT = "auto";
  # };

  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
      };
    };
  };

  systemd.user.services.gamescope-session = {
    serviceConfig = {
      TimeoutStartSec = lib.mkForce 30;
    };
  };

  services.orca.enable = false;

  systemd.user.services.gamemoded.wantedBy = lib.mkForce [ ];

  # systemd.services.steam-cef-debug = lib.mkIf config.jovian.decky-loader.enable {
  #   description = "Enable Steam CEF remote debugging for Decky Loader";

  #   wantedBy = [ "multi-user.target" ];

  #   serviceConfig = {
  #     Type = "oneshot";
  #     User = config.jovian.steam.user;
  #     ExecStart = pkgs.writeShellScript "steam-cef-debug" ''
  #       set -eu

  #       steam_dir="$HOME/.steam/steam"
  #       mkdir -p "$steam_dir"

  #       if [ ! -f "$steam_dir/.cef-enable-remote-debugging" ]; then
  #         touch "$steam_dir/.cef-enable-remote-debugging"
  #       fi
  #     '';
  #     RemainAfterExit = true;
  #   };
  # };

  hardware.enableRedistributableFirmware = true;
}

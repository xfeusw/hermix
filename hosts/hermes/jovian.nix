{ config, pkgs, ...}:

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
    decky-loader = {
      enable = true;
    };
    hardware.has.amd.gpu = true;
  };

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  programs = {
    kdeconnect.enable = true;
    xwayland.enable = true;
  };

  hardware.enableRedistributableFirmware = true;
}

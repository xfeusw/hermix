{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./jovian.nix
    ./desktop.nix

    ../../modules/nixos/nix
  ];

  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };
      efi.canTouchEfiVariables = true;
      timeout = 5;
    };
    kernelParams = [
      "quiet"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "amd_pstate=active"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
    plymouth.enable = true;
  };

  zramSwap = {
    enable = true;
    priority = 100;
    memoryPercent = 200;
    algorithm = "zstd";
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "hermes";
  networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tashkent";

  i18n.defaultLocale = "en_US.UTF-8";

  services.flatpak.enable = true;
  services.packagekit.enable = true;

  services.printing.enable = true;

  users.users."xfeusw" = {
    isNormalUser = true;
    description = "xfeusw";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "input"
      "gamemode"
    ];
    packages = with pkgs; [
      #  thunderbird
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDKt+bUYUQW+nmmFc77YkoOSmK+/WHI/ZXQ0UDsRR9Vo xfeusw@aegis"
    ];
  };

  programs.zsh.enable = true;
  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    resources
    wl-clipboard
    xclip
    kdePackages.discover
    kdePackages.krfb
    steam-rom-manager
  ];

  services.openssh.enable = true;
  system.stateVersion = "26.11";
}

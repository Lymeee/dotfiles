{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./drivers
    ./modules
  ];

  services.upower.enable = true;

  # Enable Hyprland system-wide
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
  };

  # Force session file to exist
  environment.etc."wayland-sessions/hyprland.desktop".source =
    "${pkgs.hyprland}/share/wayland-sessions/hyprland.desktop";

  programs.fish.enable = true;
  users.users.lymee.shell = pkgs.fish;
  users.defaultUserShell = pkgs.fish;

  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk 
    ];
    wlr.enable = true; 
  };

  xdg.portal.config = {
    "Hyprland" = {
      default = [ "hyprland" "gtk" ];
    };
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  networking.hostName = "nixos";
  networking.networkmanager = {
    enable = true;
    dns = "none";   # Don’t accept DHCP-provided DNS
  };

  networking.nameservers = [ "8.8.8.8" "1.1.1.1" ];

  time.timeZone = "America/New_York";
  time.hardwareClockInLocalTime = false;
  services.timesyncd.enable = true;


  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.lymee = {
    isNormalUser = true;
    description = "Lymee";
    extraGroups = [ "networkmanager" "wheel" "audio" "pipewire" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    qpwgraph
    fish
    vim

    (pkgs.writeShellScriptBin "xdg-open" ''
      exec ${pkgs.glib}/bin/gio open "$@"
    '')
  ];

  system.stateVersion = "25.05";
}


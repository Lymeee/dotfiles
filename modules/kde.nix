{ config, pkgs, ... }:

{
  # Enable base X11 support and Plasma
  services.xserver.enable = true;

  # Plasma 6 Desktop Environment (Wayland + all core services)
  services.desktopManager.plasma6.enable = true;

  # DConf is needed for many KDE settings to persist correctly
  programs.dconf.enable = true;

  # Optional: Install only core KDE system packages
  environment.systemPackages = with pkgs.kdePackages; [
    plasma-workspace
    plasma-desktop
    kde-cli-tools
    kde-gtk-config
    systemsettings
  ] ++ [
    pkgs.qt6.qtwayland
  ];

}


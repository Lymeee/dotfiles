{ config, pkgs, outputs, username, inputs, ... }:

{
  # Allow unfree packages for discord, etc.
  nixpkgs.config.allowUnfree = true;


  home = {
    username = "lymee";
    homeDirectory = "/home/lymee";
    stateVersion = "25.05";
  };

  home.sessionVariables = {
    BROWSER = "firefox-developer-edition";
    TZ = "America/New_York";
    TZDIR = "${pkgs.tzdata}/share/zoneinfo";
  };

  imports = [
    ./homemodules
    ./terminal
    ./nvim
    ./hypr
  ];

  home.packages = with pkgs; [
    google-chrome
    wget
    gcc
    gnumake
    hyprcursor
    zip
    unzip
    nix-prefetch-git
    imagemagick
    openjdk21
    prismlauncher
    xfce.thunar
    ueberzugpp  # images in terminal
    firefox-devedition-bin
    obs-studio
    vlc
    git
    discord-canary
    p7zip
    unrar
    tzdata
  ];

  programs.home-manager.enable = true;
}


{ config, pkgs, outputs, username, inputs, ... }:

{
  # Allow unfree packages for discord, etc.
  nixpkgs.config.allowUnfree = true;


  home = {
    username = "lymee";
    homeDirectory = "/home/lymee";
    stateVersion = "25.05";
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
    webcord
  ];

  programs.home-manager.enable = true;
}


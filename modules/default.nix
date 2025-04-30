{ pkgs, lib, ... }: 
{
  imports = [
    ./steam.nix
    ./fonts.nix
    ./sddm.nix
    ./fans.nix
    ./boot.nix
    ./kde.nix
  ];
}

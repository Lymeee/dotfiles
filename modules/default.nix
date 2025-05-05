{ pkgs, lib, ... }: 
{
  imports = [
    ./steam.nix
    ./fonts.nix
    ./greetd.nix
    ./fans.nix
    ./boot.nix
  ];
}

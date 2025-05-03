{ pkgs, lib, ... }: 
{
  imports = [
    ./yazi.nix
    ./wofi.nix
    ./font.nix
  ];
}

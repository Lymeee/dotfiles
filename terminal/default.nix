{ pkgs, lib, ... }: 
{
  imports = [
    ./btop.nix
    ./fish.nix
    ./fastfetch.nix
    ./kitty.nix
  ];
}

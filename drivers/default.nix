{ pkgs, lib, ... }: 
{
  imports = [
    ./amd-drivers.nix
    ./audio.nix
  ];
}

{ pkgs, lib, ... }: 
{
  imports = [
    ./kde.nix
    ./cursor.nix
    ./kvantum-miku.nix
    ./colorscheme.nix
    ./waybar.nix
    ./keybinds.nix
  ];
}

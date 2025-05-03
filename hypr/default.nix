{pkgs, lib, ...}:
{
   imports = [
    ./waybar.nix
    ./keybinds.nix
    ./cursor.nix
    ./hyprland.nix
    ];
}

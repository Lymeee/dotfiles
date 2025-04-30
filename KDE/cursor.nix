{ config, pkgs, ... }:

let
  mikuCursors = pkgs.runCommand "miku-cursor-linux" { } ''
    mkdir -p $out/share/icons/
    cp -r ${pkgs.fetchFromGitHub {
      owner = "supermariofps";
      repo = "hatsune-miku-windows-linux-cursors";
      rev = "471ff88156e9a3dc8542d23e8cae4e1c9de6e732";
      sha256 = "1w9i0h9kfsixspbs52m518spx9p7ymv8i3d5kkizhbhndkhfh88w";
    }}/miku-cursor-linux $out/share/icons/
  '';
in
{
  home.pointerCursor = {
    name = "miku-cursor-linux";
    size = 24;
    package = mikuCursors;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "miku-cursor-linux";
    XCURSOR_SIZE = "30";
  };

  # GTK 3 config
  home.file.".config/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-cursor-theme-name = miku-cursor-linux
    gtk-cursor-theme-size = 30
  '';

  # GTK 4 config
  home.file.".config/gtk-4.0/settings.ini".text = ''
    [Settings]
    gtk-cursor-theme-name = miku-cursor-linux
    gtk-cursor-theme-size = 30
  '';

  # Default fallback for Wayland/X apps (very important)
  home.file.".icons/default/index.theme".text = ''
    [Icon Theme]
    Inherits=miku-cursor-linux
  '';
}


{ config, pkgs, ... }:

let
  miku = {
    background = "#373b3e";  # charcoal
    text       = "#bec8d1";  # light gray
    highlight  = "#86cecb";  # teal
    hover      = "#e12885";  # pink
    border     = "#137a7f";  # dark teal
    accent     = "#8bd5ca";  # bright teal
  };
in
{
  # Cursor setup (rely on imported cursor.nix)
  home.pointerCursor = {
    name = "miku-cursor-linux";
    size = 30;
  };

  # Qt + Kvantum theming
  qt = {
    enable = true;
    style.name = "kvantum";
  };

  # Plasma theming (kdeglobals)
  home.file.".config/kdeglobals".text = ''
    [Colors:Window]
    BackgroundNormal=${miku.background}
    ForegroundNormal=${miku.text}
    DecorationFocus=${miku.highlight}
    DecorationHover=${miku.hover}

    [Colors:Selection]
    BackgroundNormal=${miku.highlight}
    ForegroundNormal=${miku.background}

    [General]
    Name=MikuTheme
    ColorScheme=MikuTheme
  '';
}



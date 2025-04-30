{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    settings = {
      # Miku color palette in Kitty
      background = "#373b3e";         # dark background (charcoal)
      foreground = "#bec8d1";         # light foreground (text)
      cursor     = "#86cecb";         # cursor color (teal)
      selection_background = "#86cecb";   # selection highlight (teal)
      selection_foreground = "#373b3e";   # selected text color (dark for contrast)
      # ANSI color palette (16 colors) – map Miku colors to some slots:
      color0  = "#373b3e";  # black (dark gray background)
      color1  = "#e12885";  # red (pink accent)
      color2  = "#137a7f";  # green (using dark teal)
      color3  = "#bec8d1";  # yellow (using light silver)
      color4  = "#137a7f";  # blue (dark teal)
      color5  = "#e12885";  # magenta (pink)
      color6  = "#86cecb";  # cyan (Miku teal)
      color7  = "#bec8d1";  # white (light gray)
      color8  = "#55595C";  # bright black (slightly lighter gray)
      color9  = "#ff8acb";  # bright red (soft pink)
      color10 = "#4bd9d6";  # bright green (bright aqua)
      color11 = "#dfe5eb";  # bright yellow (very light gray-blue)
      color12 = "#4bd9d6";  # bright blue (bright aqua)
      color13 = "#ff8acb";  # bright magenta (soft pink)
      color14 = "#86cecb";  # bright cyan (Miku teal again)
      color15 = "#ffffff";  # bright white (white)
      background_opacity = 0.9; 
    };
  };


}

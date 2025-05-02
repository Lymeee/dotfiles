{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  fonts.fontconfig.defaultFonts = {
    sansSerif = [ "Noto Sans" "DejaVu Sans" ];
    serif     = [ "Noto Serif" "DejaVu Serif" ];
    monospace = [ "Noto Sans Mono" "DejaVu Sans Mono" ];
    emoji     = [ "Noto Color Emoji" ];
  };

  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    dejavu_fonts
    liberation_ttf
    corefonts
    font-awesome
  ];
}


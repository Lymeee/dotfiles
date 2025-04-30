{ pkgs, ... }:

let
  mikuKvantum = pkgs.stdenv.mkDerivation {
    pname = "kvantum-miku";
    version = "1.0";

    src = pkgs.fetchFromGitHub {
      owner = "OpenNixMiku";
      repo = "kvantum-miku";
      rev = "aab6c0ef7a46300de6e4ef0375f10924a7fe0dce";  # Dummy commit for now
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # replace when uploading
    };

    installPhase = ''
      mkdir -p $out/share/Kvantum
      cp -r MikuKvantum $out/share/Kvantum/
    '';
  };
in
{
  home.packages = [ pkgs.qt6.qtstyleplugin-kvantum ];

  # Apply Kvantum theme
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  # Let qtct see the theme
  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=MikuKvantum
  '';

  # Theme itself
  xdg.dataFile."Kvantum/MikuKvantum/MikuKvantum.kvconfig".text = ''
    [General]
    translucent=true
    shadow_size=10
    shadow_color=#137a7f
    bg_color=#373b3e
    fg_color=#bec8d1
    highlight_color=#86cecb
    hover_color=#e12885
    border_color=#137a7f
  '';

  xdg.dataFile."Kvantum/MikuKvantum/MikuKvantum.svg".source =
    ./kde/MikuKvantum.svg;  # You need a real SVG theme file for polish
}


{ pkgs, ... }:

let
  mikuKvantum = pkgs.stdenv.mkDerivation {
    pname = "kvantum-miku";
    version = "1.0";

    src = pkgs.runCommand "fake-src" { } ''
      mkdir -p $out/MikuKvantum
      cat > $out/MikuKvantum/MikuKvantum.kvconfig <<EOF
[General]
translucent=true
shadow_size=10
shadow_color=#137a7f
bg_color=#373b3e
fg_color=#bec8d1
highlight_color=#86cecb
hover_color=#e12885
border_color=#137a7f
EOF

      # Optional: create a placeholder SVG file (can be replaced later)
      echo "<svg><!-- Miku theme placeholder --></svg>" > $out/MikuKvantum/MikuKvantum.svg
    '';

    installPhase = ''
      mkdir -p $out/share/Kvantum
      cp -r $src/MikuKvantum $out/share/Kvantum/
    '';
  };
in
{
  home.packages = with pkgs; [
    (qt6Packages.qtstyleplugin-kvantum or libsForQt5.qtstyleplugin-kvantum)
    mikuKvantum
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_STYLE_OVERRIDE = "kvantum";
    QT_PLUGIN_PATH = "${pkgs.qt6.qtbase.qtPluginPrefix}";
    QML2_IMPORT_PATH = "${pkgs.qt6.qtbase.qtQmlPrefix}";
  };

  qt = {
    enable = true;
    style.name = "kvantum";
  };

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=MikuKvantum
  '';
}




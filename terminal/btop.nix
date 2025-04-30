{ config, pkgs, ... }:

{
  home.packages = [ pkgs.btop ];

  xdg.configFile."btop/themes/miku.theme".text = ''
    theme[main_bg]="#373b3e"
    theme[main_fg]="#bec8d1"
    theme[title]="#86cecb"
    theme[hi_fg]="#e12885"
    theme[selected_bg]="#137a7f"
    theme[selected_fg]="#bec8d1"
    theme[inactive_fg]="#86cecb"
    theme[graph_text]="#bec8d1"
    theme[meter_bg]="#137a7f"
    theme[proc_misc]="#86cecb"
    theme[cpu_box]="#e12885"
    theme[mem_box]="#86cecb"
    theme[net_box]="#137a7f"
    theme[proc_box]="#bec8d1"
  '';

  xdg.configFile."btop/btop.conf".text = ''
    color_theme = miku
    theme_background = True
    truecolor = True
    rounded_corners = True
    transparency = True
    background_update = 2000
    update_ms = 1000
  '';
}


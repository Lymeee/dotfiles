{ pkgs, ... }:

let
  miku = {
    background = "rgba(55, 59, 62, 0.9)";
    border     = "#137a7f";
    highlight  = "#86cecb";
    text       = "#bec8d1";
    hover      = "#e12885";
  };
in
{
  services.mako = {
    enable = true;
    backgroundColor = "#373b3e";
    borderColor = "#137a7f";
    textColor = "#bec8d1";
    borderSize = 2;
    padding = "12";
    margin = "10";
    defaultTimeout = 5000;
    font = "JetBrainsMono Nerd Font 14";
  };

  programs.waybar = {
    enable = true;

    settings.mainBar = {
      layer = "top";
      position = "top";
      margin-top = 4;
      margin-bottom = 0;
      margin-left = 6;
      margin-right = 6;
      spacing = 6;

      modules-left = [ "custom/power" "wireplumber" ];
      modules-center = [ "hyprland/workspaces" ];
      modules-right = [ "notifications" "clock" "tray" ];

      "clock" = {
        format = "{:%Y年%m月%d日 %H:%M}";
        tooltip = false;
        justify = "center";
      };

      "custom/power" = {
        format = "󰐥";
        tooltip = false;
        on-click = "wlogout";
        justify = "center";
      };

      "tray" = {
        icon-size = 15;
        spacing = 10;
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        all-outputs = true;
        format-icons = {
          "1" = "一";
          "2" = "二";
          "3" = "三";
          "4" = "四";
          "5" = "五";
          "6" = "六";
          "7" = "七";
          "8" = "八";
          "9" = "九";
          "10" = "十";
        };
      };

      "wireplumber" = {
        on-click = "pavucontrol";
        on-click-right = "amixer sset Master toggle 1>/dev/null";
        on-scroll-down = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 0.05-";
        on-scroll-up = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 0.05+";
        format = "󰕾 {volume}%";
        format-source = "󰍬";
        format-source-muted = "󰍭";
        format-muted = "󰖁 MUT";
        format-icons = {
          "default" = "󰕾";
          "bluetooth" = "";
        };
        justify = "center";
      };

      "notifications" = {
        tooltip = true;
        format = "🩵 {count}";
        format-clear = "🩵";
        on-click = "makoctl dismiss";
      };
    };

    style = ''
      * {
        font-family: JetBrainsMono Nerd Font;
        font-size: 16px;
        font-weight: 500;
        border: none;
      }

      window#waybar {
        background-color: ${miku.background};
        color: ${miku.text};
        border: 2px solid ${miku.border};
        border-radius: 12px;
        padding: 4px 16px;
      }

      #workspaces button {
        background: transparent;
        color: ${miku.text};
        padding: 4px 10px;
        margin: 2px;
        border-radius: 8px;
        transition: all 0.3s ease;
      }

      #workspaces button.active {
        background-color: ${miku.highlight};
        color: ${miku.background};
      }

      #workspaces button:hover {
        background-color: ${miku.hover};
        color: ${miku.background};
      }

      #wireplumber, #tray, #clock, #notifications, #custom-power {
        padding: 0 10px;
        color: ${miku.text};
      }

      #wireplumber:hover, #tray:hover, #clock:hover, #notifications:hover, #custom-power:hover {
        background-color: ${miku.hover};
        color: ${miku.background};
        border-radius: 8px;
      }

      #notifications {
        font-size: 18px;
        padding-left: 12px;
        padding-right: 12px;
      }
    '';
  };
}

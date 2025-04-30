{ pkgs, config, inputs, ... }:

{
  home.packages = with pkgs; [
    hyprpicker
    hyprlock
    hyprpaper
    hyprshot
    inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    settings = {
      general = {
        layout = "dwindle";
        gaps_in = 4;
        gaps_out = 6;
        border_size = 1;
        "col.active_border" = "rgb(86cecb)";
        "col.inactive_border" = "rgb(137a7f)";
        no_border_on_floating = false;
      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
        new_window_takes_over_fullscreen = 2;
        middle_click_paste = false;
        disable_splash_rendering = true;
        background_color = "0xff373b3e";
      };

      dwindle = {
        force_split = 1;
        preserve_split = "yes";
        pseudotile = "yes";
        use_active_for_splits = true;
        split_width_multiplier = 1.0;
        special_scale_factor = 1.0;
      };

      master.new_status = "master";
    };

    extraConfig = ''
      decoration {
        rounding = 10

        blur {
          enabled = true
          size = 8
          passes = 2
        }

        shadow {
          enabled = true
          range = 8
          render_power = 10
          offset = 0 1
          color = 0xff86cecb
          color_inactive = 0xff137a7f
        }

        active_opacity = 1.0
        inactive_opacity = 1.0
        fullscreen_opacity = 1.0
      }

      animations {
        enabled = true
        bezier = easeOutCubic, 0.05, 0.9, 0.1, 1.05
        animation = windows, 1, 2, easeOutCubic
        animation = windowsOut, 1, 2, default, popin 80%
        animation = border, 1, 3, default
        animation = fade, 1, 2, default
        animation = workspaces, 1, 1, default
      }

      # Workspaces 1–5 on DP-2
      workspace = 1, monitor:DP-2, persistent:true, default:true;
      workspace = 2, monitor:DP-2, persistent:true;
      workspace = 3, monitor:DP-2, persistent:true;
      workspace = 4, monitor:DP-2, persistent:true;
      workspace = 5, monitor:DP-2, persistent:true;

      # Workspaces 6–10 on HDMI-A-2
      workspace = 6, monitor:HDMI-A-2, persistent:true;
      workspace = 7, monitor:HDMI-A-2, persistent:true;
      workspace = 8, monitor:HDMI-A-2, persistent:true;
      workspace = 9, monitor:HDMI-A-2, persistent:true;
      workspace = 10, monitor:HDMI-A-2, persistent:true;


      exec-once = hyprpaper
    '';
  };

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = /home/lymee/images/misc/mikubackground.jpg
    wallpaper = DP-2,/home/lymee/images/misc/mikubackground.jpg
    wallpaper = HDMI-A-2,/home/lymee/images/misc/mikubackground.jpg
  '';
}


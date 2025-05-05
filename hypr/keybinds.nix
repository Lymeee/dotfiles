{ username, config, ... }: 

{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      $mainMod = SUPER

      env = XCURSOR_THEME, miku-cursor-linux
      env = XCURSOR_SIZE, 24

      # Monitor Setup
      monitor=DP-2,2560x1440@360,0x0,1
      monitor=HDMI-A-2,2560x1440@144,2560x0,1,transform,3

      # Input Settings
      input {
        kb_layout = us
        follow_mouse = 1
        repeat_delay = 140
        repeat_rate = 30
        numlock_by_default = 1
        accel_profile = flat
        sensitivity = 0
        force_no_accel = true
        touchpad {
          natural_scroll = 1
        }
      }

      # Exec Keybinds
      bind = $mainMod, T, exec, kitty
      bind = $mainMod, F, exec, /home/lymee/bin/firefox-safe
      bind = $mainMod, S, exec, steam
      bind = $mainMod, D, exec, webcord
      bind = $mainMod, A, exec, wofi -show drun
      bind = $mainMod SHIFT, S, exec, hyprshot -m region -c --save-path /home/lymee/images/screenshots
      bind = , Print, exec, hyprshot -m output -o DP-2 -c --save-path /home/lymee/images/screenshots

      # Tiling / Window
      bind = $mainMod SHIFT, I, togglesplit,
      bind = ALT, Return, fullscreen,
      bind = $mainMod SHIFT, F, togglefloating,
      bind = $mainMod SHIFT, C, exit,
      bind = $mainMod SHIFT, Q, killactive,

      # Move windows
      bind = $mainMod SHIFT, left, movewindow, l
      bind = $mainMod SHIFT, right, movewindow, r
      bind = $mainMod SHIFT, up, movewindow, u
      bind = $mainMod SHIFT, down, movewindow, d
      bind = $mainMod SHIFT, h, movewindow, l
      bind = $mainMod SHIFT, l, movewindow, r
      bind = $mainMod SHIFT, k, movewindow, u
      bind = $mainMod SHIFT, j, movewindow, d
      bind = $mainMod ALT, left, swapwindow, l
      bind = $mainMod ALT, right, swapwindow, r
      bind = $mainMod ALT, up, swapwindow, u
      bind = $mainMod ALT, down, swapwindow, d

      # Cycle and Stack
      bind = ALT, Tab, cyclenext
      bind = ALT, Shift, bringactivetotop

      # Workspaces (Numeric)
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move to workspace (Numeric)
      bind = $mainMod CTRL, 1, movetoworkspace, 1
      bind = $mainMod CTRL, 2, movetoworkspace, 2
      bind = $mainMod CTRL, 3, movetoworkspace, 3
      bind = $mainMod CTRL, 4, movetoworkspace, 4
      bind = $mainMod CTRL, 5, movetoworkspace, 5
      bind = $mainMod CTRL, 6, movetoworkspace, 6
      bind = $mainMod CTRL, 7, movetoworkspace, 7
      bind = $mainMod CTRL, 8, movetoworkspace, 8
      bind = $mainMod CTRL, 9, movetoworkspace, 9
      bind = $mainMod CTRL, 0, movetoworkspace, 10

      # Move to workspace silently (Numeric)
      bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
      bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
      bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
      bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
      bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
      bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
      bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
      bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
      bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
      bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10

      # Special
      bind = $mainMod SHIFT, SPACE, movetoworkspace, special
      bind = $mainMod, SPACE, togglespecialworkspace
      bind = $mainMod CONTROL, right, workspace, e+1
      bind = $mainMod CONTROL, left, workspace, e-1

      # Mouse
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      # Resize
      bind = CTRL SHIFT, left, resizeactive, -15 0
      bind = CTRL SHIFT, right, resizeactive, 15 0
      bind = CTRL SHIFT, up, resizeactive, 0 -15
      bind = CTRL SHIFT, down, resizeactive, 0 15
      bind = CTRL SHIFT, h, resizeactive, -15 0
      bind = CTRL SHIFT, l, resizeactive, 15 0
      bind = CTRL SHIFT, k, resizeactive, 0 -15
      bind = CTRL SHIFT, j, resizeactive, 0 15

      # Rules
      windowrulev2 = workspace 6 silent, class:^(webcord)$
      windowrulev2 = workspace 2 silent, class:^(steam)$
      windowrulev2 = workspace 2 silent, class:^(steam_app_.*)$

      exec-once = mako
      exec-once = waybar
    '';
  };
}


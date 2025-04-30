{ config, ... }:

{
  # KDE global shortcuts can be adjusted via KHotkeys or manually with config file overrides.
  # We'll write Plasma-compatible keybindings similar to your Hyprland ones.
  home.file.".config/kglobalshortcutsrc".text = ''
    [khotkeys]
    _k_friendly_name=Global Shortcuts
    _k_global_shortcut=Meta+T
    konsole=Meta+T,none,Launch Terminal

    firefox.desktop=Meta+F,none,Open Firefox
    steam.desktop=Meta+S,none,Launch Steam
    discord.desktop=Meta+D,none,Open Discord

    rofi-wayland.desktop=Meta+A,none,Open App Launcher
    spectacle=Shift+Meta+S,none,Region Screenshot
    spectacle=Print,none,Full Screenshot
  '';
}


{ config, pkgs, ... }:

{
  home.packages = [ pkgs.yazi ];

  xdg.configFile."yazi/theme.toml".text = ''
    [palette]
    bg = "#373b3e"
    fg = "#bec8d1"
    black = "#373b3e"
    red = "#e12885"
    green = "#137a7f"
    yellow = "#bec8d1"
    blue = "#137a7f"
    magenta = "#e12885"
    cyan = "#86cecb"
    white = "#bec8d1"
    orange = "#ff8acb"

    # Bright versions
    bright_black = "#55595C"
    bright_red = "#ff8acb"
    bright_green = "#4bd9d6"
    bright_yellow = "#dfe5eb"
    bright_blue = "#4bd9d6"
    bright_magenta = "#ff8acb"
    bright_cyan = "#86cecb"
    bright_white = "#ffffff"

    # Extra accents (used by status line, highlights, etc.)
    accent = "#86cecb"
    hint = "#137a7f"
    info = "#bec8d1"
    warning = "#ff8acb"
    error = "#e12885"

    # Transparency (requires truecolor + proper terminal support like Kitty)
    transparent_bg = false

    [ui]
    border = "rounded"
    padding = 1
    gutter = 1
    title_fg = "cyan"
    selected_bg = "#86cecb"
    selected_fg = "#373b3e"
    cursor = "#e12885"
  '';
}


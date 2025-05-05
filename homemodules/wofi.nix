{ config, pkgs, ... }:

let
  miku = {
    background = "#373b3e";  # charcoal
    text       = "#bec8d1";  # light gray
    highlight  = "#86cecb";  # teal
    hover      = "#e12885";  # pink
    border     = "#137a7f";  # dark teal
    accent     = "#8bd5ca";  # bright teal
  };
in {
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      prompt = "Search:";
      term = "kitty";
      location = "center";
      width = 600;
      height = 400;
      lines = 10;
      columns = 1;
      allow_markup = true;
      no_actions = true;
      insensitive = true;
      hide_scroll = true;
      normal_window = false; # use layer shell for blur + Hyprland support
    };

    style = ''
      * {
        font-family: "Fira Sans", sans-serif;
        font-size: 14px;
        border: none;
        outline: none;
      }

      window {
        background-color: rgba(55, 59, 62, 0.85); /* semi-transparent charcoal */
        border-radius: 10px;
        color: ${miku.text};
      }

      #outer-box {
        margin: 8px;
        padding: 10px;
        box-shadow: none;
      }

      #input {
        margin: 8px;
        padding: 8px;
        background-color: rgba(255, 255, 255, 0.07);
        color: ${miku.text};
        border-radius: 6px;
      }

      #inner-box {
        margin: 4px;
        background-color: transparent;
      }

      #entry {
        padding: 6px;
        margin: 2px;
        border-radius: 6px;
      }

      #entry:selected {
        background-color: rgba(19, 122, 127, 0.8); /* dark teal */
        border-left: 4px solid ${miku.hover}; /* pink accent */
      }

      #text {
        color: ${miku.text};
      }

      #text:selected {
        color: white;
      }
    '';
  };

  # Optional: install wofi explicitly in case another module doesn't
  home.packages = with pkgs; [ wofi ];
}


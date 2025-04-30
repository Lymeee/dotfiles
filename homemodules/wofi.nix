{ config, pkgs, ... }:

let
  miku = {
    background = "#373b3e";         # charcoal background
    text       = "#bec8d1";         # light text
    highlight  = "#86cecb";         # teal highlight
    hover      = "#e12885";         # pink hover
    border     = "#137a7f";         # teal border
    accent     = "#8bd5ca";         # accent color (Miku teal)
  };
in {
  home.packages = with pkgs; [
    wofi
    numix-icon-theme-circle  # Ensure icon theme is available
  ];

  # Define Wofi configuration for the appearance
  xdg.configFile."wofi/style.css".text = ''
    * {
      font-family: JetBrainsMono Nerd Font;
      font-size: 14px;
      color: ${miku.text};
      border: none;
    }

    window {
      background-color: ${miku.background};
      border: 2px solid ${miku.border};
      border-radius: 10px;
      opacity: 0.9;  /* Transparency */
    }

    mainbox {
      background-color: ${miku.background};
    }

    #input {
      margin: 10px;
      padding: 6px 10px;
      border: 2px solid ${miku.border};
      background-color: ${miku.background};
      color: ${miku.text};
      border-radius: 5px;
      opacity: 0.9;  /* Transparency */
    }

    #entry:selected {
      background-color: ${miku.highlight};
      color: ${miku.background};
    }

    #entry:hover {
      background-color: ${miku.hover};
      color: ${miku.background};
    }

    #entry {
      padding: 8px;
      margin: 2px;
      border-radius: 3px;
      background-color: rgba(0, 0, 0, 0.3);  /* Slightly transparent entries */
      color: rgba(195, 231, 237, 1);
      transition: background 0.3s ease-out;
    }

    #entry.selected {
      background-color: ${miku.highlight};
      color: ${miku.background};
      font-weight: bold;
    }

    #img {
      margin-right: 10px;
      border-radius: 6px;
      background-color: transparent;
      min-width: 0px;
      min-height: 0px;
    }

    #text {
      color: inherit;
      font-size: 14px;
      margin-left: 4px;
    }
  '';

  # Define Wofi config options
  xdg.configFile."wofi/config".text = ''
    modi: "drun"
    icon-theme: "Numix-Circle"  # Ensure icons are enabled in Wofi
    font: "JetBrains Mono Regular 13"
    show-icons: true
    terminal: "wezterm"
    drun-display-format: "{icon} {name}"
    location: 0
    disable-history: false
    hide-scrollbar: true
    display-drun: "   Apps "
    sidebar-mode: true
    border-radius: 10
    normal_window=true  # Ensures the wofi window behaves as a normal window
    width=600
    height=400
  '';
}


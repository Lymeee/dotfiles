{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wofi

    # Wrapper script to ensure style is applied
    (pkgs.writeShellScriptBin "wofi-miku" ''
      exec ${pkgs.wofi}/bin/wofi --show drun --style ~/.config/wofi/style.css "$@"
    '')
  ];

  xdg.configFile."wofi/style.css".text = ''
    * {
      font-family: "Fira Sans", sans-serif;
      font-size: 14px;
      border: none;
      outline: none;
    }

    window {
      background-color: rgba(55, 59, 62, 0.85);  /* #373b3e w/ transparency */
      border-radius: 10px;
      color: #bec8d1;
    }

    #outer-box {
      margin: 8px;
      padding: 10px;
      box-shadow: none;
      background-color: transparent;
    }

    #input {
      margin: 8px;
      padding: 8px;
      background-color: rgba(255, 255, 255, 0.07); /* subtle translucent */
      color: #bec8d1;
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
      background-color: transparent;
    }

    #entry:selected {
      background-color: rgba(19, 122, 127, 0.8);  /* #137a7f w/ transparency */
      border-left: 4px solid #e12885;  /* pink highlight */
    }

    #text {
      color: #bec8d1;
    }

    #text:selected {
      color: white;
    }
  '';

  xdg.configFile."wofi/config".text = ''
    show = drun
    prompt = Search:
    term = kitty
    hide_scroll = true
    width = 600
    height = 400
    lines = 10
    columns = 1
    allow_markup = true
    no_actions = true
    insensitive = true
    location = center
    normal_window = false
  '';
}

